import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20, // Adjust for keyboard
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Switch Property',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 15),

            // Display the list of properties dynamically
            GetBuilder<PropertyFormController>(
              builder: (controller) {
                if (controller.properties.isEmpty) {
                  return Center(child: Text('No properties added yet.'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true, // Only take necessary space
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.properties.length,
                    itemBuilder: (context, index) {
                      final property = controller.properties[index];

                       // Calculate total rooms by summing rooms in all floors
                      int totalRooms = property.floors.fold(0, (sum, floor) {
                        return sum + (floor.totalRooms ?? 0);  // Handle null totalRooms safely
                      });

                      // Calculate available rooms (optional, use a similar approach)
                      int availableRooms = property.floors.fold(0, (sum, floor) {
                        return sum + (floor.rooms.where((room) => room.availability == 1).length);
                      });
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _buildActionItem(
                          icon: Icons.home,
                          propertyName: property.name.toString(),
                          totalRoom: totalRooms.toString(),// Dynamic total rooms
                          availableRoom:availableRooms.toString(), // Dynamic available rooms
                          onPressed: () async {
                            // Store selected property details in SharedPreferences
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('selected_property_id', property.id.toString());
                            await prefs.setString('selected_property_name', property.name.toString());

                            String? storedPropertyName = prefs.getString('selected_property_name');
                            await controller.updatePropertyName(storedPropertyName ?? "");

                            // Log selected property details
                            print("Selected Property ID: ${property.id}");
                            String? storedPropertyId = prefs.getString('selected_property_id');
                            print("Stored Property ID from SharedPreferences: $storedPropertyId");

                            // Trigger floor fetch from floor controller
                            final floorController = Get.put(AddFloorController());
                            floorController.fetchFloors();

                            Navigator.pop(context); // Close the modal
                          },
                        ),
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

  // Action item for each property
  Widget _buildActionItem({
    required IconData icon,
    required String propertyName,
    required String totalRoom,
    required String availableRoom,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 248, 248),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.home_outlined, size: 30, color: Colors.black),
                    SizedBox(width: 12),
                    Text(
                      propertyName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  child: Text(
                    "Current",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.bed_outlined, size: 30, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Total Rooms: ",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      totalRoom,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.bed_outlined, size: 30, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      "Available Rooms: ",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      availableRoom,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
