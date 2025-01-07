import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/models/room/add_room_model.dart';
import 'package:pg/views/bottomnav_withcurve.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/custom_button.dart';

class AddRoomForm extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());
  final floorController = Get.put(AddFloorController());
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
                          onChanged: roomController.setRoomName,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Unit Type',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            '1RK',
                            '2RK',
                            '1BHK',
                            '2BHK',
                            '3BHK',
                            '4Bhk',
                            'Studio Apartment'
                          ]
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
                      // Expanded(
                      //   child: DropdownButtonFormField<Floor>(
                      //     decoration: InputDecoration(
                      //       labelText: 'Floor',
                      //       border: OutlineInputBorder(),
                      //     ),
                      //     items:floorController.floorlist
                      //         .map((floor) => DropdownMenuItem(
                      //               value: floor.id,
                      //               child: Text(floor.floorNo.toString()),
                      //             ))
                      //         .toList(),
                      //     value: controller.floor,
                      //     onChanged: (value) => controller.setFloor(value!),
                      //   ),
                      // ),

                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Floor',
                            border: OutlineInputBorder(),
                          ),
                          // Map each Floor object to a DropdownMenuItem with its id as the value
                          items: floorController.floorlist
                              .map((floor) => DropdownMenuItem<String>(
                                    value: floor.id
                                        .toString(), // Use the floor's id as the value
                                    child: Text(floor.floorNo
                                        .toString()), // Display the floorNo or other details
                                  ))
                              .toList(),

                          // Set the value to the current floor id from the controller
                          value: controller
                              .floor, // controller.floor should be the id (String)

                          onChanged: (String? value) {
                            if (value != null) {
                              // Find the corresponding Floor object by id and update the controller
                              controller.setFloor(
                                  value); // Set the selected floor id (String)
                            }
                          },
                        ),
                      ),

                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Sharing Type',
                            border: OutlineInputBorder(),
                          ),
                          items: [
                            'Single',
                            'Double',
                            'Triple',
                            '4 Sharing',
                            '5 Sharing',
                            '6 Sharing',
                            '7 Sharing',
                            '8 Sharing',
                            '9 Sharing',
                            '10 Sharing',
                            'Dormitory'
                          ]
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          value: controller.sharingType,
                          onChanged: (value) =>
                              controller.setSharingType(value!),
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
                          onChanged: roomController.setRoomMinimumStayCharge,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Maximum Charges',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: roomController.setRoomMaximumStayCharge,
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
                          onChanged: (value) =>
                              controller.setAvailability(value!),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text('No'),
                          value: 'No',
                          groupValue: controller.isAvailable,
                          onChanged: (value) =>
                              controller.setAvailability(value!),
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

                  // Column(
                  //   children: controller.facilities.keys.map((facility) {
                  //     return CheckboxListTile(
                  //       title: Text(facility),
                  //       value: controller.facilities[facility],
                  //       onChanged: (value) {
                  //         controller.toggleFacility(facility, value!);
                  //       },
                  //     );
                  //   }).toList(),
                  // ),



                  Obx(() {
                    return GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent scrolling if not needed
                      shrinkWrap: true, // Let the GridView fit its content
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of items in a row
                        crossAxisSpacing:
                            16, // Space between items horizontally
                        mainAxisSpacing: 16, // Space between items vertically
                        childAspectRatio:
                            1, // Adjust this to control item height vs width
                      ),
                      itemCount: controller.facilities.keys.length,
                      itemBuilder: (context, index) {
                        String facility =
                            controller.facilities.keys.elementAt(index);
                        bool isSelected =
                            controller.facilities[facility] ?? false;

                        return GestureDetector(
                          onTap: () {
                            controller.toggleFacility(facility, !isSelected);
                          },
                          child: Material(
                            elevation: 1,
                             color: isSelected
                                          ? Theme.of(context)
                                              .primaryColor
                                          : Colors.white70,
                                          borderRadius: BorderRadius.circular(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    _getFacilityIcon(facility),
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black54,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  facility,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                        fontSize: 10
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),






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
                    child: CustomButton(
                        text: "Add Room",
                        onPressed: () {
                          print(
                              "${controller.roomName}  ${controller.unitType} ${controller.floor} ${controller.sharingType}");
                          print(
                              "${controller.isAvailable}  ${controller.roomrent} ${controller.roomArea} ${controller.maximumStayCharge}");
                          print(
                              "${controller.minimumStayCharge}  ${controller.remarks} ${controller.lastaddedreading} ${controller.selectedDate}");

                          //  if (formKey.currentState!.validate()) {
                          // Process form submission

                          roomController.createRoom(AddRoom(
                              name: "${controller.roomName}",
                              capacity: 4,
                              price:
                                  double.parse(controller.roomrent.toString()),
                              availability: true,
                              unitType: "${controller.unitType}",
                              sharingType: "2",
                              rent:
                                  double.parse(controller.roomrent.toString()),
                              maximum: double.parse(
                                  controller.maximumStayCharge.toString()),
                              minimum: double.parse(
                                  controller.minimumStayCharge.toString()),
                              areaSqft:
                                  double.parse(controller.roomArea.toString()),
                              remarks: "${controller.remarks}",
                              facilities: controller.getSelectedFacilities(),
                              lastReading: double.parse(
                                  controller.lastaddedreading.toString()),
                              date: "${controller.selectedDate}",
                              other: ["other"]));

                          Get.snackbar(
                              'Success', 'Form submitted successfully!',
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

  IconData _getFacilityIcon(String facility) {
    switch (facility) {
      case 'Bed':
        return Icons.bed;
      case 'Mattress':
        return Icons.sensor_occupied;
      case 'Pillow':
        return Icons.bedroom_child;
      case 'Personal Cupboard':
        return Icons.door_front_door;
      case 'Fridge':
        return Icons.kitchen;
      case 'Washing Machine':
        return Icons.local_laundry_service;
      case 'Water Purifier':
        return Icons.water_drop;
      case 'Geyser':
        return Icons.water;
      case 'Wi-Fi':
        return Icons.wifi;
      case 'Daily Cleaning':
        return Icons.cleaning_services;
      case 'Gas':
        return Icons.local_gas_station;
      case 'AC':
        return Icons.ac_unit;
      case 'Extension Board':
        return Icons.power;
      case 'TV':
        return Icons.tv;
      default:
        return Icons.home; // Default icon for unspecified facilities
    }
  }
}
