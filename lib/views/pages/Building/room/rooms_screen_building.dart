import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/pages/Building/room/add_room_form.dart';
import 'package:pg/views/pages/People/tenant/add_tenant_form.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';
import 'package:pg/views/widgets/room_card.dart';

class RoomsScreen extends StatelessWidget {
   const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final roomController= Get.put(RoomController());
     
        
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildTrainInformationServices(),
              const SizedBox(height: 20),
          
          
              // Updated search bar with filter icon on the right
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Search Bar Container
                    Expanded(
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Search Properties',
                            hintText: 'Enter search term',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.filter_list),
                              onPressed: () {
                                // handle filter button action
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            // handle search
                          },
                        ),
                      ),
                    ),
                
                      const SizedBox(width: 5),
                
                    // "More" Button
                    ElevatedButton(
                      onPressed: () {},
                       style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepPurple,
                                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), 
                                ),
                                shadowColor: Colors.deepPurpleAccent.withOpacity(0.3), 
                                elevation: 5,
                
                       ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("More", style: TextStyle(fontSize: 10),),
                      ),
                      
                    
                        )        ],
                ),
              ),
          
              const SizedBox(height: 20),
          
          
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Available Rooms",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 10),
              _buildRoomList(),
            ],
          ),
        ),
      ),


       // Floating Action Button with text
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingActionButton.extended(
          onPressed: (){
            Get.to(AddRoomForm());
          }, 
          label: const Icon(Icons.add),
          backgroundColor: Colors.white, 
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Horizontal list of statistics
  Widget _buildTrainInformationServices() {
       final List<Map<String, dynamic>> items = [
    {"title": "Total Rooms", "data": "0", "iconColor": Colors.blue},
    {"title": "Total Beds", "data": "300", "iconColor": Colors.orange},
    {"title": "Vacant Rooms", "data": "4000", "iconColor": Colors.red},
    {"title": "Semi Vacant Room ", "data": "7500", "iconColor": Colors.orange},
    {"title": "Vacant Beds", "data": "50", "iconColor": Colors.blue},
    {"title": "Overbooked Rooms", "data": "50", "iconColor": Colors.red},
    {"title": "Overbooked Beds", "data": "50", "iconColor": Colors.orange},
    {"title": "Occupied Rooms", "data": "50", "iconColor": Colors.green},
    {"title": "Occupied Beds", "data": "50", "iconColor": Colors.orange},
    {"title": "Vacant Beds", "data": "50", "iconColor": Colors.blue},
  ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: featureCard(
              icon: Icons.currency_rupee,
              title: items[index]["title"]!,
              data: items[index]["data"]!,
               iconColor: items[index]["iconColor"],
            ),
          );
        },
      ),
    );
  }

 Widget _buildRoomList() {
  final tenantController= Get.put(AddTenantsController());
   final floorController = Get.put(AddFloorController());
  return GetBuilder<RoomController>(
    builder: (roomController) {
      if (roomController.rooms.isEmpty) {
        return const Center(
          child: Text("Room not added yet"),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Disable inner scroll
          itemCount: roomController.rooms.length,
          itemBuilder: (context, index) {
            final room = roomController.rooms[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: roomCardWidget(
                context: context,
                title: room.name.toString(),
                beds: room.capacity ?? 0,
                pricePerBed: room.price??"",
                roomType: room.unitType ?? 'N/A',
                availabilityStatus: room.availability.toString()=="1"?"Available":"Booked",
                onShare: () {
                  // Handle share action
                },
                onAddTenant: () {
                  // Handle add tenant action
                  floorController.fetchFloors();
                  Get.to(AddTenantForm());
                
                },
              ),
            );
          },
        );
      }
    },
  );
}

}
