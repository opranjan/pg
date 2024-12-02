import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/views/pages/Money/Adddues/add_dues_page.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class AddMoneyDues extends StatelessWidget {
  const AddMoneyDues({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the cards
    final List<Map<String, dynamic>> duesData = [
      {
        "icon": Icons.money,
        "title": "Rent",
        "fixedValue": "₹0.0 fixed",
      },
      {
        "icon": Icons.bolt,
        "title": "Electricity",
        "fixedValue": "₹500 fixed",
      },
      {
        "icon": Icons.water,
        "title": "Water",
        "fixedValue": "₹200 fixed",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Money Dues"),
      ),
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

          // List of AddDuesCards using ListView.builder
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5),
              itemCount: duesData.length,
              itemBuilder: (context, index) {
                final data = duesData[index];
                return addDuesCard(
                  icon: data["icon"],
                  title: data["title"],
                  fixedValue: data["fixedValue"],
                  onButtonPressed: () {
                    Get.to(AddDuesPage());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
