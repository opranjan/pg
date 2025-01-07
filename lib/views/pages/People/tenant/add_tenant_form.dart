import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/models/tenants/add_tenants.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/custom_button.dart';

class AddTenantForm extends StatelessWidget {
  const AddTenantForm({super.key});

  @override
  Widget build(BuildContext context) {
    final floorControlller = Get.put(AddFloorController());
    return Scaffold(
      appBar: commonAppBar(
        context,
        "Add Tenant",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<AddTenantsController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tenant Name
                _buildTextField(
                  label: "Tenant Name",
                  onChanged: controller.setTenantName,
                  keyboardType: TextInputType.text,
                  validator: (value) =>
                      value!.isEmpty ? "Name cannot be empty" : null,
                ),

                const SizedBox(height: 16),

                // Tenant Phone
                _buildTextField(
                  label: "Phone",
                  onChanged: controller.setTenantPhone,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? "Phone number cannot be empty" : null,
                ),

                const SizedBox(height: 16),

                // Tenant Phone
                _buildTextField(
                  label: "Alternate Phone",
                  onChanged: controller.setTenantAltPhone,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? "Phone number cannot be empty" : null,
                ),

                const SizedBox(height: 16),

                // Select Floor
      //           _buildDropdown<int>(
      //             label: "Select Floor",
      //             value: controller.selectedFloor.value,
      //             items: floorControlller.floorlist
      //                 .asMap()
      //                 .entries
      //                 .map<DropdownMenuItem<int>>(
      //               (entry) {
      //                 int index =
      //                     entry.key; // The index of the floor in the list
      //                 var floor =
      //                     entry.value; // The actual Floor object at this index

      //                      // Print floor information for debugging
      // print('Floor ID: ${floor.id}, Floor Name: ${floor.floorNo}'); 
      // print('Selected Floor Value: ${controller.selectedFloor.value}');


      //                 return DropdownMenuItem<int>(
      //                   value: floor.id, // Set value to the index of the floor
      //                   child: Text(
      //                       'Floor ${index+1}'), // Display index + 1 as the floor number
      //                 );
      //               },
      //             ).toList(),
      //             onChanged: (newFloor) => controller.setFloor(newFloor!),
      //           ),




      _buildDropdown<int>(
  label: "Select Floor",
  value: controller.selectedFloor.value != null &&
          floorControlller.floorlist
              .map((floor) => floor.id)
              .contains(controller.selectedFloor.value)
      ? controller.selectedFloor.value
      : floorControlller.floorlist.first.id, // Fallback to first floor ID
  items: floorControlller.floorlist.map<DropdownMenuItem<int>>((floor) {
    print('Floor ID: ${floor.id}, Floor Name: ${floor.floorNo}');
    return DropdownMenuItem<int>(
      value: floor.id,
      child: Text('Floor ${floor.id}'),
    );
  }).toList(),
  onChanged: (newFloor) => controller.setFloor(newFloor!),
),


                const SizedBox(height: 16),

                // Select Room
                _buildDropdown<int>(
                  label: "Select Room",
                  value: controller.selectedRoom.value,
                  items: List.generate(5, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text('Room ${index + 1}'),
                    );
                  }),
                  onChanged: (newRoom) => controller.setRoom(newRoom!),
                ),

                const SizedBox(height: 16),

                // Rent
                _buildTextField(
                  label: "Rent",
                  onChanged: (value) =>
                      controller.setRent(double.tryParse(value) ?? 0),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty || double.tryParse(value) == null
                          ? "Please enter a valid rent amount"
                          : null,
                ),

                const SizedBox(height: 16),

                // Security Deposit
                _buildTextField(
                  label: "Security Deposit",
                  onChanged: (value) => controller
                      .setSecurityDeposit(double.tryParse(value) ?? 0),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty || double.tryParse(value) == null
                          ? "Please enter a valid deposit amount"
                          : null,
                ),

                SizedBox(
                  height: 50,
                ),

                // Button at the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    width: double.infinity,
                    text: "Add Tenant",
                    onPressed: () {
                      if (controller.isFormValid.value) {
                        // Handle submit logic here, e.g., saving data

                        print(
                            "${controller.tenantName} ${controller.tenantPhone} ${controller.tenantAltPhone}  ${controller.selectedFloor} ${controller.selectedRoom}  ${controller.rent}  ${controller.securityDeposit}");

                        controller.createTenant(AddTenant(
                            name: controller.tenantName.value,
                            phone: "${controller.tenantPhone}",
                            altphone: "${controller.tenantAltPhone}",
                            buildingId: 1,
                            roomId: controller.selectedRoom.value,
                            unitType: "Single",
                            floor: "${controller.selectedRoom.value}",
                            sharingType: "Double",
                            dailyStayChargesMin: 500,
                            dailyStayChargesMax: 600,
                            isRoomAvailable: true,
                            electricityReadingLast: 150,
                            electricityReadingDate: '2024-11-27',
                            roomPhotos: "url/photo"));
                        Get.snackbar(
                            'Form Submitted', 'Tenant Added Successfully');
                      } else {
                        Get.snackbar('Error',
                            'Please fill all required fields correctly');
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Reusable method for creating TextFormFields with validation
  Widget _buildTextField({
    required String label,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.deepPurple),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  // Reusable method for creating Dropdowns
  Widget _buildDropdown<T>({
    required String label,
    required T value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        onChanged: onChanged,
        items: items,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.deepPurple),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
