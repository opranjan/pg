import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/models/floor/floor_model.dart';

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
              return ListTile(
                title: Text(floor.floorNo.toString()), // Assuming `name` is a property of Floor model
                // subtitle: Text('Floor ID: ${floor.id}'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle tap event, like showing floor details or editing
                },
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

