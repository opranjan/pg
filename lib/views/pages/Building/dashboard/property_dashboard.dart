import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/views/pages/Building/dashboard/add_building_modal.dart';
import 'package:pg/views/widgets/building/build_building_featurecard.dart';
import 'package:pg/views/widgets/building/property_layout.dart';
import 'package:pg/views/widgets/custom_button.dart';

class PropertyDashboard extends StatelessWidget {
  const PropertyDashboard({super.key});

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
   
    final propertyController = Get.put(PropertyFormController());

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

            // CustomButton(text: "Test", onPressed: (){
            //   propertyController.fetchProperties();
            // }),

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
                        name: property.name,
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

      // Floating Action Button with text
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton.extended(
          onPressed: () => _openNewPropertyModal(context),
          label: const Text("Add New Property", style: TextStyle(fontSize: 12)),
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Building overview widget (horizontal list)
  Widget _buildBuildingOverview() {
    // Example data for the horizontal list
    final List<Map<String, String>> items = [
      {"title": "Today's Collections", "data": "200"},
      {"title": "November Collections", "data": "300"},
      {"title": "November Dues", "data": "4000"},
      {"title": "Total Dues", "data": "7500"},
      {"title": "November Expenses", "data": "50"},
      {"title": "Rent Defaulters", "data": "300"},
      {"title": "Current Deposit", "data": "200"},
      {"title": "Unpaid Deposit", "data": "300"},
      {"title": "November Profit", "data": "400"},
      {"title": "Potential Rent", "data": "600"},
    ];

    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildBuildingFeatureCard(
              icon: Icons.currency_rupee,
              title: items[index]["title"]!,
              data: items[index]["data"]!,
            ),
          );
        },
      ),
    );
  }
}
