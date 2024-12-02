import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/custom_button.dart';

class AddRoomForm extends StatelessWidget {
  final RoomController controller = Get.put(RoomController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "Add Room Form", ""),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: GetBuilder<RoomController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    'Room Renting Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  // Room Name & Unit Type
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Room Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Unit Type',
                            border: OutlineInputBorder(),
                          ),
                          items: ['1RK', '2RK', '1BHK', '2BHK', '3BHK', 'Studio Apartment']
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          value: controller.unitType,
                          onChanged: (value) => controller.setUnitType(value!),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Floor & Sharing Type
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Floor',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Ground', '1', '2', '3', '4+']
                              .map((floor) => DropdownMenuItem(
                                    value: floor,
                                    child: Text(floor),
                                  ))
                              .toList(),
                          value: controller.floor,
                          onChanged: (value) => controller.setFloor(value!),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Sharing Type',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Single', 'Double', 'Triple', 'Dormitory']
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          value: controller.sharingType,
                          onChanged: (value) => controller.setSharingType(value!),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Rent
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Rent',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Daily Charges
                  Text(
                    'Daily Day Charges',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  // Minimum & Maximum Charges
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Minimum Charges',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Maximum Charges',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Area
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Area (sq. ft.)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Availability
                  Text(
                    'Is this Room available to Rent?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('Yes'),
                          value: 'Yes',
                          groupValue: controller.isAvailable,
                          onChanged: (value) => controller.setAvailability(value!),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: controller.isAvailable,
                          onChanged: (value) => controller.setAvailability(value!),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Remarks
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Remarks',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Room Facilities
                  Text(
                    'Room Facilities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: controller.facilities.keys.map((facility) {
                      return CheckboxListTile(
                        title: Text(facility),
                        value: controller.facilities[facility],
                        onChanged: (value) {
                          controller.toggleFacility(facility, value!);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),

                  // Electricity Reading
                  Text(
                    'Electricity Reading',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  // Last Reading & Date
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Last Added Reading',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              controller.selectDate(pickedDate);
                            }
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'On Date',
                              border: OutlineInputBorder(),
                            ),
                            child: Text(
                              controller.selectedDate == null
                                  ? 'Select Date'
                                  : '${controller.selectedDate!.day}/${controller.selectedDate!.month}/${controller.selectedDate!.year}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

               


                  Center(
                    child: CustomButton(text: "Add Room", onPressed: (){
                       if (formKey.currentState!.validate()) {
                            // Process form submission
                            Get.snackbar('Success', 'Form submitted successfully!',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                    }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}