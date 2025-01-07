import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/views/pages/Money/Adddues/add_dues_model.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';

class AddDuesPage extends StatelessWidget {
  String? duetype;
   AddDuesPage({super.key, this.duetype});



    // Method to show the bottom sheet modal
  void _openNewPropertyModal(BuildContext context, String tenantid) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows control over the height of the sheet
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)), // Rounded corners for the bottom sheet
      ),
      builder: (context) {
        return AddDuesModal(tenantid: tenantid,); // Use the custom modal
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBar(context, duetype),
       body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal:5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.5), width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 24, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Rooms, Tenants",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      border: InputBorder.none, // Removes underline
                    ),
                    onTap: () {},
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          

          // List of AddDuesCards using ListView.builder
          GetBuilder<AddTenantsController>(
            builder: (tc) {
              return Expanded(
                child: ListView.builder(
                  itemCount: tc.tenantlist.length,
                  itemBuilder: (context, index) {
                    final tenants = tc.tenantlist[index];
                    return addDuesTenantCard(
                      context: context,
                      title:tenants.name.toString(),
                      room: "0",
                      onButtonPressed: () {
                        _openNewPropertyModal(context, tenants.id.toString());
                      },
                    );
                  },
                ),
              );
            }
          ),
        ],
      ),



     


      
      );
  

     }
  }






