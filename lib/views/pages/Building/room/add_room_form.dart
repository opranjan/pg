import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/models/room/add_room_model.dart';
import 'package:pg/views/bottomnav_withcurve.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/custom_button.dart';

class AddRoomForm extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "Add Room Form"),
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

                          onChanged:roomController.setRoomName ,
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

                    onChanged: roomController.setRoomRent,
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

                          onChanged:roomController.setRoomMinimumStayCharge ,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Maximum Charges',
                            border: OutlineInputBorder(),
                          ),
                           onChanged:roomController.setRoomMaximumStayCharge ,
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

                    onChanged: controller.setRoomArea,
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

                    onChanged: controller.setRemarks,
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
                          onChanged: controller.setLastaddedreading,
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
                    child: CustomButton(text: "Add Room",
                     onPressed: (){
                      print("${controller.roomName}  ${controller.unitType} ${controller.floor} ${controller.sharingType}");
                        print("${controller.isAvailable}  ${controller.roomrent} ${controller.roomArea} ${controller.maximumStayCharge}");
                         print("${controller.minimumStayCharge}  ${controller.remarks} ${controller.lastaddedreading} ${controller.selectedDate}");

                      //  if (formKey.currentState!.validate()) {
                            // Process form submission

                            roomController.createRoom(
                              AddRoom(
                                name: "${controller.roomName}",
                                capacity: 4,
                                 price: double.parse(controller.roomrent.toString()),
                                 availability: true, 
                                 unitType: "${controller.unitType}",
                                  sharingType: "2", 
                                  rent: double.parse(controller.roomrent.toString()),
                                  maximum: double.parse(controller.maximumStayCharge.toString()),
                                  minimum: double.parse(controller.minimumStayCharge.toString()), 
                                  areaSqft:double.parse(controller.roomArea.toString()), 
                                  remarks: "${controller.remarks}", 
                                  facilities: ["Ac, Tv, freeze, Washing machine"], 
                                  lastReading: double.parse(controller.lastaddedreading.toString()), 
                                  date: "${controller.selectedDate}", 
                                  other: ["other"]
                                  ));
                          
                            Get.snackbar('Success', 'Form submitted successfully!',
                                snackPosition: SnackPosition.BOTTOM);

                                Get.to(() => BottomNavBar());
                          // }
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