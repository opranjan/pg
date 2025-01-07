import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pg/constants/constant.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';
import 'package:url_launcher/url_launcher.dart';

class TenantScreen extends StatefulWidget {
  const TenantScreen({super.key});

  @override
  _TenantScreenState createState() => _TenantScreenState();
}

class _TenantScreenState extends State<TenantScreen> {
  final tenants = Get.put(AddTenantsController());
  final propertyController = Get.put(PropertyFormController());

  String? _selectedBuildingId; // Variable to store selected building ID

  @override
  void initState() {
    super.initState();
    propertyController.fetchProperties(); // Fetch the properties (building IDs)
  }

  _launchWhatsapp(String whatsapp) async {
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid, mode: LaunchMode.externalApplication);
    } else {
      snackBar("error", "WhatsApp is not installed on the device");
    }
  }

  // Make phone call flutter app
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // Filter tenants based on selected building ID
  List getFilteredTenants() {
    if (_selectedBuildingId == null || _selectedBuildingId!.isEmpty) {
      return tenants.tenantlist; // Return all tenants if no filter is selected
    } else {
      return tenants.tenantlist
          .where(
              (tenant) => tenant.buildingId.toString() == _selectedBuildingId)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTenantInfo(),
              const SizedBox(height: 20),

              // Building ID Dropdown (filter)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Filter Tenants By Building :',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      Obx(() {
                        return DropdownButton<String>(
                          menuMaxHeight: 200,
                          value: _selectedBuildingId,
                          hint: const Text('Select Building ID'),
                          onChanged: (value) {
                            setState(() {
                              _selectedBuildingId = value;
                            });
                          },
                          items: propertyController.properties
                              .map<DropdownMenuItem<String>>((building) {
                            return DropdownMenuItem<String>(
                              value: building.id.toString(),
                              child: Text(building.name.toString()),
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ListView for filtered tenants
              Obx(() {
                final filteredTenants = getFilteredTenants();
                if (filteredTenants.isEmpty) {
                  return Center(
                      child:
                          Text("No tenants found for the selected building."));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredTenants.length,
                  itemBuilder: (context, index) {
                    final tenant = filteredTenants[index];
                    final formattedDate = tenant.createdAt != null
                        ? DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(tenant.createdAt.toString()))
                        : 'N/A';

                    return tenantCard(
                      tenantName: tenant.name.toString(),
                      tenantDues: tenant.altphone
                          .toString(), // Display tenant's alternate phone as dues
                      duesDate: formattedDate,
                      tenantRent: tenant.phone
                          .toString(), // Display tenant's phone as rent
                      onPressedcall: () {
                        _makePhoneCall(tenant.phone.toString());
                      },
                      onPressedWhatsapp: () {
                        _launchWhatsapp(tenant.altphone.toString());
                      },
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  // Horizontal list of statistics
  Widget _buildTenantInfo() {
    final List<Map<String, dynamic>> items = [
      {"title": "Total Tenants", "data": "0", "iconColor": Colors.blue},
      {"title": "New Tenants", "data": "300", "iconColor": Colors.green},
      {"title": "Under Notice", "data": "4000", "iconColor": Colors.red},
      {"title": "Joining Requests", "data": "7500", "iconColor": Colors.orange},
      {"title": "Contact Not Added", "data": "50", "iconColor": Colors.orange},
    ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: featureCard(
              icon: Icons.currency_rupee,
              title: items[index]["title"]!,
              data: items[index]["data"]!,
              iconColor: items[index]["iconColor"],
            ),
          );
        },
      ),
    );
  }
}
