import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/widget_constant.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/views/widgets/custom_text_field.dart'; // Import the custom text field widget


class AddBuildingModal extends StatelessWidget {
  // Instantiate the GetX controller
  final PropertyFormController controller = Get.put(PropertyFormController());

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen for the modal
    double screenHeight = MediaQuery.of(context).size.height;
    double modalHeight = screenHeight * 0.8;

    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: modalHeight, // Modal height is set to 60% of the screen height
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Property',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // Property Name
                CustomTextField(
                  label: 'Property Name',
                  hint: 'Enter Property Name',
                  fieldValue: controller.propertyName,
                ),
                SizedBox(height: 16),
                // Owner Name
                CustomTextField(
                  label: 'Owner Name',
                  hint: 'Enter Owner Name',
                  fieldValue: controller.ownerName,
                ),
                SizedBox(height: 16),
                // Owner Phone
                CustomTextField(
                  label: 'Owner Phone',
                  hint: 'Enter Owner Phone Number',
                  fieldValue: controller.ownerPhone,
                ),
                SizedBox(height: 16),
                // Property Pincode
                CustomTextField(
                  label: 'Property Pincode',
                  hint: 'Enter Property Pincode',
                  fieldValue: controller.propertyPincode,
                ),
                SizedBox(height: 16),
                // Checkbox for Terms and Conditions
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value ?? false; // Update checkbox state
                        },
                      );
                    }),
                    Text('I agree to the terms and conditions'),
                  ],
                ),
                SizedBox(height: 16),
                // Create Property Button
             

                customButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  title: "Add Building", onPressed: (){
                   controller.createProperty();
                   controller.fetchProperties();
                      Get.back();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
