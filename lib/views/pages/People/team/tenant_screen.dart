import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:pg/controllers/TenantController/TenantController.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class TenantScreen extends StatelessWidget {
  const TenantScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final tenants = Get.put(AddTenantsController());



    // List of tenants
    // final List<Map<String, String>> tenants = [
    //   {"tenantName": "John Doe", "tenantDues": "10000", "duesDate": "20-11-24", "tenantRent": "6000"},
    //   {"tenantName": "Jane Smith", "tenantDues": "8000", "duesDate": "22-11-24", "tenantRent": "5500"},
    //   {"tenantName": "Michael Johnson", "tenantDues": "15000", "duesDate": "18-11-24", "tenantRent": "7000"},
    //   {"tenantName": "Emily Davis", "tenantDues": "5000", "duesDate": "25-11-24", "tenantRent": "4500"},
    // ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTenantInfo(),
            const SizedBox(height: 20),

            // Updated search bar with filter icon on the right
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search Bar Container
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search Tenant',
                          hintText: 'Enter search term',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.filter_list),
                            onPressed: () {
                              // handle filter button action
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          // handle search
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),

                  // "More" Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.deepPurpleAccent.withOpacity(0.3),
                      elevation: 5,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "More",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tenant Card List
            GetBuilder<AddTenantsController>(
              builder: (tc) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:tc.tenantlist.length,
                  itemBuilder: (context, index) {
                   final tenants = tc.tenantlist[index];


                    // Format the createdAt date to "dd-MM-yyyy"
      final formattedDate = tenants.createdAt != null
          ? DateFormat('dd-MM-yyyy').format(DateTime.parse(tenants.createdAt.toString()))
          : 'N/A';
                    return tenantCard(
                      tenantName: tenants.name.toString(),
                      tenantDues: tenants.altphone.toString(),
                      duesDate:formattedDate,
                      tenantRent: tenants.phone.toString(),
                    );
                  },
                );
              }
            ),
          ],
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
