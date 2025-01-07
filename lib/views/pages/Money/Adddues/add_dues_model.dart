import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/duescontroller/dues_controller.dart';

class AddDuesModal extends StatelessWidget {
  final String? tenantid;
   AddDuesModal({super.key, this.tenantid});

  @override
  Widget build(BuildContext context) {
    // Get the controller instance
    final controller = Get.put(DuesController());

    // Get the height of the screen for the modal
    double screenHeight = MediaQuery.of(context).size.height;
    double modalHeight = screenHeight * 0.7;

    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: modalHeight, // Modal height set to 70% of the screen height
            decoration: BoxDecoration(
              color: Colors.white, // Set white color for the background
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row with Title and Close Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Due For",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Black color for text
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black, size: 28),
                      onPressed: () {
                        Get.back(); // Close the modal
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Amount Field with Currency Icon
                _buildTextField(
                  controller: controller.amountController.value,
                  label: 'Amount',
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20),

                // Due Date Field with Calendar Icon and Date Picker
                _buildTextField(
                  controller: controller.dueDateController.value,
                  label: 'Due Date',
                  icon: Icons.calendar_today,
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      controller.dueDateController.value.text =
                          '${selectedDate.toLocal()}'.split(' ')[0]; // 'YYYY-MM-DD'
                    }
                  },
                ),

                SizedBox(height: 20),

                // Remarks Field with Textarea
                _buildTextField(
                  controller: controller.remarksController.value,
                  label: 'Remarks',
                  icon: Icons.comment_bank_rounded,
                  maxLines: 2,
                ),

                SizedBox(height: 50),

                // Submit Button
                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:Theme.of(context).primaryColor ,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        print("Amount: ${controller.amountController.value.text}");
                        print("Due Date: ${controller.dueDateController.value.text}");
                        print("Remarks: ${controller.remarksController.value.text}");
                        controller.addDuesToTenant(tenantid.toString());
                        Get.back(); // Close the modal
                      },
                      child: Text(
                        "Add Dues",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField widget with styling and optional onTap for date picker
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    Function()? onTap,
    int maxLines = 1,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 24, // Larger icon for better visibility
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black), // Label text color
          filled: true,
          fillColor: Colors.white, // White background for the TextField
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.2), // Subtle border color
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.blue, // Border color when focused
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.2), // Border color when enabled
              width: 1.5,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
