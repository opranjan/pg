import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/views/pages/Building/room/room_fllorwise_screen.dart';


class AddFloor extends StatelessWidget {
  const AddFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddFloorController>(
        init: AddFloorController(),
        builder: (fc) {
          if (fc.isLoading.value) {
            return const Center(child: CircularProgressIndicator()); // Loading indicator
          }

          if (fc.floorlist.isEmpty) {
            return const Center(child: Text('No floors available'));
          }

          return ListView.builder(
            itemCount: fc.floorlist.length,
            itemBuilder: (context, index) {
              final floor = fc.floorlist[index];
              return Container(
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.white, // Set a background color
    borderRadius: BorderRadius.circular(12), // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 2), // Shadow position
      ),
    ],
  ),
  child: ListTile(
    
    contentPadding: EdgeInsets.zero, // Removes internal padding from the ListTile
    title: Row(
      children: [
        Icon(
          Icons.apartment,
          color: Theme.of(context).primaryColor,
          size: 28, // Increase icon size for better visibility
        ),
        SizedBox(width: 15),
        Text(
          "Floor : " + index.toString(),
          style: TextStyle(
            fontSize: 16, // Slightly larger text for better readability
            fontWeight: FontWeight.bold, // Bold text for emphasis
          ),
        ),
      ],
    ),
    trailing: Icon(
      Icons.arrow_circle_right,
      color: Theme.of(context).primaryColor,
      size: 28, // Matching the size of the icon
    ),
    onTap: () {
      // Handle tap event, like showing floor details or editing
      final roomController =Get.put(RoomController());
      roomController.fetchRooms(floor.id.toString());
      Get.to(RoomFloorWise(floor_id: floor.id.toString(),));
    },
  ),
);

            },
          );
        },
      ),


             // Floating Action Button with text
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton.extended(
          onPressed: (){
            // Show the custom dialog to add a floor
            _showCustomDialog(context, Get.find<AddFloorController>());
          }, 
          label: const Icon(Icons.add),
          backgroundColor: Colors.white, 
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }


  
}





  // Function to show the custom dialog for adding a floor
  void _showCustomDialog(BuildContext context, AddFloorController controller) {
    final TextEditingController _totalFloorsController = TextEditingController();
    bool isError = false; // Track error state for the input field

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 10,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dialog title with custom style
                Text(
                  'Add Total Floors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor, // Title color
                  ),
                ),
                const SizedBox(height: 15),

                // TextField for Total Floors
                TextField(
                  controller: _totalFloorsController,
                  decoration: InputDecoration(
                    labelText: 'Total Floors',
                    labelStyle: TextStyle(color: Theme.of(context).primaryColor), // Label color
                    hintText: 'Enter Total Number of Floors',
                    hintStyle: const TextStyle(color: Colors.grey), // Hint color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor), // Border color on focus
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey), // Border color
                    ),
                  ),
                  keyboardType: TextInputType.number, // Only numeric input
                  onChanged: (value) {
                    isError = value.isEmpty; // Set error flag if empty
                  },
                ),
                const SizedBox(height: 20),

                // Show error message if the input field is empty
                isError
                    ? const Text(
                        'Total floors cannot be empty!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      )
                    : const SizedBox.shrink(),

                // Action buttons (Cancel and Submit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        if (_totalFloorsController.text.isNotEmpty) {
                          controller.totalfloors.value = _totalFloorsController.text;
                          controller.addFloor(); // Add floor
                          Navigator.of(context).pop(); // Close dialog
                        } else {
                          // If the input is empty, show the error
                          isError = true;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Submit', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

