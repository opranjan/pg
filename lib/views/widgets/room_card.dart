import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/views/pages/Building/room/add_room_form.dart';

Widget roomCardWidget({
  required BuildContext context, // Add BuildContext as a parameter
  required String title,
  required int beds,
  required dynamic pricePerBed,
  required String roomType,
  required String availabilityStatus,
  required VoidCallback onShare,
  required VoidCallback onAddTenant,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Share Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ensures the title is visible
                ),
              ),
              IconButton(
                icon: Icon(Icons.share, color: Theme.of(context).primaryColor),
                onPressed: onShare,
              ),
            ],
          ),
          SizedBox(height: 8),
          // Info, Beds, and Price Row
          Row(
            children: [
              Icon(Icons.info, color: Theme.of(context).primaryColor),
              SizedBox(width: 8),
              Row(
                children: List.generate(
                  beds,
                  (index) => Icon(Icons.bed, color: Colors.red[400]), // Lighter red color for better contrast
                ),
              ),
              Spacer(),
              Text(
                '₹${pricePerBed}/bed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800], // Ensures text is clearly readable
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Tags Row (Room Type, Availability)
          Row(
            children: [
              Chip(
                label: Text(roomType),
                backgroundColor: Colors.blue[50], // Light background for room type
                labelStyle: TextStyle(color: Colors.blue[800]), // Ensure text color contrasts
              ),
              SizedBox(width: 8),
              Chip(
                label: Text(availabilityStatus),
                backgroundColor: availabilityStatus == 'Available' 
                    ? Colors.green[50] // Green background for available
                    : Colors.red[50],  // Red background for unavailable
                labelStyle: TextStyle(
                  color: availabilityStatus == 'Available'
                      ? Colors.green[800] // Dark green text for available
                      : Colors.red[800],  // Dark red text for unavailable
                ),
              ),
            ],
          ),
          Divider(),
          // Facilities and Add Tenant Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Get.to(AddRoomForm());
                },
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                label: Text(
                  'Add facilities',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              ElevatedButton(
                onPressed: onAddTenant,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Use primary color from theme
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add Tenant',
                  style: TextStyle(color: Colors.white), // Ensures button text is white
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
