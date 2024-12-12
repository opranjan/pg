import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/views/pages/Money/Adddues/add_dues_page.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class AddMoneyDues extends StatelessWidget {
  const AddMoneyDues({super.key});

  @override
  Widget build(BuildContext context) {
  final List<Map<String, dynamic>> duesData = [
  {
    "icon": Icons.card_membership, // Joining fee might be represented by a membership card icon
    "title": "Joining Fee",
    "fixedValue": "₹0.0 fixed",
  },
  {
    "icon": Icons.home, // Rent is better represented by a house/home icon
    "title": "Rent",
    "fixedValue": "₹500 fixed",
  },
  {
    "icon": Icons.security, // Security bill should be represented by a security icon
    "title": "Security Bill",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.flash_on, // Electricity bill can be represented by a lightning bolt icon
    "title": "Electricity Bill",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.business, // Police verification could be represented by a business or verification icon
    "title": "Police Verification",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.restaurant, // Mess is often associated with food, so restaurant or food icon works
    "title": "Mess",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.warning, // Late fines are often associated with warnings or penalties
    "title": "Late Fine",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.wifi, // Wifi is represented with a wifi icon
    "title": "Wifi",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.build, // Maintenance bill is best represented by a build (construction) icon
    "title": "Maintenance Bill",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.local_laundry_service, // Laundry bill can be represented by a laundry service icon
    "title": "Laundry Bill",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.document_scanner, // Rent agreement charges can be associated with a document or agreement icon
    "title": "Rent Agreement Charges",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.monetization_on, // 3 Month Rent Packages can be represented by a monetary icon
    "title": "3 Month Rent Packages",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.monetization_on, // 6 Month Rent Package also uses the same icon (monetary)
    "title": "6 Month Rent Package",
    "fixedValue": "₹200 fixed",
  },
  {
    "icon": Icons.category, // "Other" category can be represented by a generic category icon
    "title": "Other",
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
          Expanded(
            child: ListView.builder(
              itemCount: duesData.length,
              itemBuilder: (context, index) {
                final data = duesData[index];
                return addDuesCard(
                  context: context,
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
