import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pg/controllers/propertycontroller/room_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/pages/Building/room/add_room_form.dart';
import 'package:pg/views/pages/People/tenant/add_tenant_form.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/room_card.dart';

class RoomFloorWise extends StatelessWidget {
  final String floor_id;
  const RoomFloorWise({super.key, required this.floor_id});

   @override
  Widget build(BuildContext context) {
      final roomController= Get.put(RoomController());
        
    return Scaffold(
      appBar: commonAppBar(context, "Rooms"),
      body: SingleChildScrollView(
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




   Widget _buildRoomList() {
  final tenantController= Get.put(AddTenantsController());
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

                  Get.to(AddTenantForm());
                
              //       tenantController.createTenant(
              // AddTenant(
              //   name: "Akash",
              //   phone: "9876543567",
              //   altphone: "3683832738273", 
              //   buildingId: 1,
              //   roomId: 1,
              //   unitType: "Single",
              //   floor: "1", 
              //   sharingType: "Double", 
              //   dailyStayChargesMin: 500, 
              //   dailyStayChargesMax: 600, 
              //   isRoomAvailable:true, 
              //   electricityReadingLast: 150, 
              //   electricityReadingDate:'2024-11-27', 
              //   roomPhotos: "url/photo"
              //        ));
                
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