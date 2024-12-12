import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/views/pages/Building/dashboard/add_building_modal.dart';
import 'package:pg/views/widgets/building/property_layout.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class PeopleDashboard extends StatelessWidget {
  const PeopleDashboard({super.key});

  // Method to show the bottom sheet modal
  void _openNewPropertyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows control over the height of the sheet
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)), // Rounded corners for the bottom sheet
      ),
      builder: (context) {
        return AddBuildingModal(); // Use the custom modal
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the PropertyFormController
    final PropertyFormController controller = Get.put(PropertyFormController()); // Ensure the controller is initialized

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Properties',
                  hintText: 'Enter search term',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Add your search functionality here
                },
              ),
            ),
            SizedBox(height: 10),
            _buildBuildingOverview(),

           // Display the list of properties
            GetBuilder<PropertyFormController>(
              builder: (controller) {
                // Listen to changes in the properties list
                if (controller.properties.isEmpty) {
                  return Center(child: Text('No properties added yet.'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true, // Allow the list to take up only necessary space
                    itemCount: controller.properties.length,
                     physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final property = controller.properties[index];
                      return PropertyLayout(
                        name: property.name.toString(),
                        propertyItems: [
                          PropertyItem(icon: Icons.bed, title: "Filled Beds", value: "0"),
                          PropertyItem(icon: Icons.bed_outlined, title: "Vacant Beds", value: "0"),
                          PropertyItem(icon: Icons.error, title: "Under Notice", value: "0"),
                          PropertyItem(icon: Icons.person, title: "Tenants", value: "0"),
                           PropertyItem(icon: Icons.currency_rupee, title: "Collections", value: "0"),
                            
                             PropertyItem(icon: Icons.book, title: "Booking", value: "600"),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),

      
    );
  }

  // Building overview widget (horizontal list)
  Widget _buildBuildingOverview() {
  // Example data for the horizontal list
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
            iconColor: items[index]["iconColor"], // Ensure the correct key is used here
          ),
        );
      },
    ),
  );
}
}
