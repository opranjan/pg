import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pg/controllers/duescontroller/dues_controller.dart';
import 'package:pg/controllers/expansecontroller/expanse_controller.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class ExpanseScreen extends StatelessWidget {
  const ExpanseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
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

          // Dues List using GetBuilder for DuesController
          GetBuilder<ExpanseController>(
            init: ExpanseController(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator()); // Loading indicator
              }

              if (controller.expanselist.isEmpty) {
                return const Center(child: Text('No dues available'));
              }

              // List of dues
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.expanselist.length,
                  itemBuilder: (context, index) {
                    final expanse = controller.expanselist[index]; // Get the due data

                    // Customize duesCard here (using actual data)
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                        child:expanseCard(
                          context: context, 
                          description: "${expanse.description}", 
                          expanseamount: "₹ ${expanse.amount}", 
                          paymentmethod: "${expanse.paymentMode}", 
                          paidby: "Paid By :${expanse.paidBy}", 
                          paidto: "Paid To :${expanse.paidTo}"
                          )
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
