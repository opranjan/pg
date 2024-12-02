import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Container(
            color: Color.fromARGB(255, 248, 244, 244),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

               Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10), // Apply round corners to the image
      child: Image.asset(
        'assets/images/pgbanner.png',
        fit: BoxFit.contain, // You can change this to other BoxFit values as needed
      ),
    ),
  ),
),


                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "Property Overview",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(67, 66, 66, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildPropertyCardList(),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "People Overview",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 67, 66, 66),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildPeopleCardList(),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "Money Overview",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 67, 66, 66),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildMoneyCardList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCardList() {
    // Example data for the horizontal list
     final List<Map<String, dynamic>> items = [
    {"title": "Today's Collections", "data": "5000", "iconColor": Colors.green},
    {"title": "November Collections", "data": "250000", "iconColor": Colors.green},
    {"title": "November Dues", "data": "60000", "iconColor": Colors.red},
    {"title": "Total Dues", "data": "7500", "iconColor": Colors.red},
    {"title": "November Expenses", "data": "7500", "iconColor": Colors.orange},
    {"title": "Rent Defaulters", "data": "7500", "iconColor": Colors.red},
    {"title": "Current Deposit", "data": "7500", "iconColor": Colors.green},
    {"title": "Unpaid Deposit", "data": "7500", "iconColor": Colors.red},
    {"title": "November Profit", "data": "7500", "iconColor": Colors.orange},
    {"title": "Potential Rent", "data": "7500", "iconColor": Colors.green},
  ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: featureCard(
              icon: Icons.currency_rupee,
              title: items[index]["title"]!,
              data: items[index]["data"]!,
              iconColor: items[index]['iconColor']
            ),
          );
        },
      ),
    );
  }




  // people overview

    // Building overview widget (horizontal list)
  Widget _buildPeopleCardList() {
  // Example data for the horizontal list
  final List<Map<String, dynamic>> items = [
    {"title": "Total Tenants", "data": "0", "iconColor": Colors.blue},
    {"title": "New Tenants", "data": "300", "iconColor": Colors.green},
    {"title": "Under Notice", "data": "4000", "iconColor": Colors.red},
    {"title": "Joining Requests", "data": "7500", "iconColor": Colors.orange},
    {"title": "Contact Not Added", "data": "50", "iconColor": Colors.orange},
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
            iconColor: items[index]["iconColor"], // Ensure the correct key is used here
          ),
        );
      },
    ),
  );
}





  Widget _buildMoneyCardList() {
    // Example data for the horizontal list
    final List<Map<String, dynamic>> items = [
      {"title": "Total Dues", "data": "5000", "iconColor": Colors.red},
      {"title": "Overdue Dues", "data": "250000", "iconColor": Colors.red},
      {"title": "November Dues", "data": "60000", "iconColor": Colors.red},
      {"title": "November Rent Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "November Electricity Bill Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "November Cash Deposits Due", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Unpaid Rent", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Electricity Bill Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Future Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Late Fine Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Short Term Dues", "data": "7500", "iconColor": Colors.red},
      {"title": "Total Long Term Dues", "data": "7500", "iconColor": Colors.red},
    ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
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

}
