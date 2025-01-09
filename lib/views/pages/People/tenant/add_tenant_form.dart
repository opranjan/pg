import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/models/tenants/add_tenant_model.dart';
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
                  height: 10,
                ),




             Material(
              elevation: 4,
               child: Container(
                 width: double.infinity, // Makes the container take the full width
                 margin: EdgeInsets.symmetric( vertical: 8),
                 padding: EdgeInsets.all(16),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.2),
                       spreadRadius: 2,
                       blurRadius: 5,
                       offset: Offset(0, 3), // Shadow position
                     ),
                   ],
                   border: Border.all(color: Colors.grey.shade300),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Lock-in-Period",
                           style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                           ),
                         ),

                            Text(
                              controller.selectedLockInPeriod.value ?? "Select",
                              style: TextStyle(color: Colors.blue),
                            ),
                         PopupMenuButton<String>(
                           icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                           onSelected: (value) {
                print("Selected: $value"); // Handle selection
                           },
                           itemBuilder: (context) => [
                PopupMenuItem(
                  value: '1 Month',
                  child: Text('1 Month'),
                ),
                PopupMenuItem(
                  value: '3 Month',
                  child: Text('3 Month'),
                ),
                PopupMenuItem(
                  value: '6 Month',
                  child: Text('6 Month'),
                ),
               
                 PopupMenuItem(
                  value: '11 Month',
                  child: Text('11 Month'),
                ),
                           ],
                         ),
                       ],
                     ),
                     Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Notice-Period",
                           style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                           ),
                         ),


                           Text(
                              controller.selectedNoticePeriod.value ?? "Select",
                              style: TextStyle(color: Colors.blue),
                            ),


                         PopupMenuButton<String>(
                           icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                           onSelected: (value) {
                print("Selected: $value"); // Handle selection
                           },
                           itemBuilder: (context) => [
                PopupMenuItem(
                  value: '15 Days',
                  child: Text('15 Days'),
                ),
                PopupMenuItem(
                  value: '30 Days',
                  child: Text('30 Days'),
                ),
                PopupMenuItem(
                  value: '60 Days',
                  child: Text('60 Days'),
                ),
               
                PopupMenuItem(
                  value: '90 Days',
                  child: Text('90 Days'),
                ),
                           ],
                         ),
                       ],
                     ),
                     Divider(color: Colors.grey.shade300, thickness: 1, height: 20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Agreement Period",
                           style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                           ),
                         ),




                            Text(
                              controller.selectedAgreementPeriod.value ?? "Select",
                              style: TextStyle(color: Colors.blue),
                            ),



                         PopupMenuButton<String>(
                           icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                           onSelected: (value) {
                print("Selected: $value"); // Handle selection
                           },
                           itemBuilder: (context) => [
                PopupMenuItem(
                  value: '1 Month',
                  child: Text('1 Month'),
                ),
                PopupMenuItem(
                  value: '2 Months',
                  child: Text('2 Months'),
                ),
                PopupMenuItem(
                  value: '3 Months',
                  child: Text('3 Months'),
                ),
               
               
               
                 PopupMenuItem(
                  value: '6 Months',
                  child: Text('6 Months'),
                ),
               
                 PopupMenuItem(
                  value: '11 Months',
                  child: Text('11 Months'),
                ),
               
                 PopupMenuItem(
                  value: '2 Years',
                  child: Text('2 Years'),
                ),
                           ],
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
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
                        

                        controller.addTenant(
                          AddTenantModel(
                            tenant:Tenant(
                              name: controller.tenantName.value, 
                              phone: "${controller.tenantPhone}", 
                              altphone: "${controller.tenantAltPhone}",
                              buildingId: 1, 
                              roomId: controller.selectedRoom.value, 
                              unitType: "Single", 
                              floor:"${controller.selectedFloor.value}",
                              rent: 5000, 
                              sharingType: "Double", 
                              dailyStayChargesMin: 500, 
                              dailyStayChargesMax: 600, 
                              isRoomAvailable: true, 
                              electricityReadingLast: 150, 
                              electricityReadingDate:  '2024-11-27', 
                              roomPhotos: "url/photo") , 


                            stayDetails: StayDetails(
                              building: "building A",
                               room: "Room A", 
                               moveIn: "2025-01-01", 
                               moveOut: "2025-12-31", 
                               lockInPeriod: 12, 
                               noticePeriod: 3, 
                               agreementPeriod: 12, 
                               rentalFrequency: "monthly", 
                               addRentOn: 15, 
                               fixedRent: 2000, 
                               regularSecurityDeposit: 10000, 
                               roomElectricityMeter: "12345", 
                               tenantElectricityMeter: "12345", 
                               otherDetail: {}
                               ), 



                            paymentDetails: PaymentDetails(
                              paymentDate:  "2025-01-05", 
                              amountPaid: 500, 
                              dueDate:  "2025-01-05", 
                              dueAmount: 1000, 
                              description:  "Rent payment"
                              )
                            )
                          );
                        
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
