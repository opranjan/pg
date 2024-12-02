import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/models/floor/floor_model.dart';

class AddFloor extends StatelessWidget {
  const AddFloor({super.key});

  @override
  Widget build(BuildContext context) {
    final AddFloorController controller = Get.put(AddFloorController());

    return Scaffold(
      body: Center(
        child: GetBuilder<AddFloorController>(
          builder: (controller) {
            // Check if the floorlist is empty
            if (controller.floorlist.isEmpty) {
              return ElevatedButton(
                onPressed: () {
                  _showCustomDialog(context, controller);
                },
                child: Text('Add Floor'),
              );
            } else {
              // If floorlist is not empty, show the list of floors
              return ListView.builder(
                itemCount: controller.floorlist.length,
                itemBuilder: (context, index) {
                  Floor floor = controller.floorlist[index];
                  return ListTile(
                    title: Text('Floor ${floor.id}'),
                    subtitle: Text('Total Floors: ${floor.floorNumber}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  // Function to show the custom dialog for adding a floor
  void _showCustomDialog(BuildContext context, AddFloorController controller) {
    final TextEditingController _totalFloorsController = TextEditingController();

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
                ),
                const SizedBox(height: 20),

                // Show error message if the input field is empty or invalid
                if (_totalFloorsController.text.isEmpty)
                  const Text(
                    'Total floors cannot be empty!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),

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
                        controller.addFloor();
                        Navigator.of(context).pop();
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
}
