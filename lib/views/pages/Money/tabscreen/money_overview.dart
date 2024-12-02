import 'package:flutter/material.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class MoneyOverview extends StatelessWidget {
  const MoneyOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Container(
                     width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5), // Added border radius
                      boxShadow: [
                        BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
                        crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the left
                        children: [
              // Data above icon and title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '₹ 100',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 117, 67),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Today's Collection",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 23, 82, 7)
                          .withOpacity(0.2), // Soft background for icon
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.money,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
                        ],
                      ),
                    ),
                  ),
              
              
              
              
              
              
                   Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5), // Added border radius
                      boxShadow: [
                        BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
                        crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the left
                        children: [
              // Data above icon and title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '₹ 100',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 117, 67),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "January's Collection",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 23, 82, 7)
                          .withOpacity(0.2), // Soft background for icon
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.money,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
                        ],
                      ),
                    ),
                  )
              ],),
            ),




            _buildFeatureCardList(),

            moneyCard(
            buildingName: "Shiv Boys Hostel", 
            unpaiddues: "10000", 
            noofunpaidtenant: "10", 
            todaysCollection: "10000", 
            thisMonthCollection: "1000000", 
            thisMonthExpanse: "1000", 
            onPressed: (){}),

            moneyCard(
            buildingName: "Shiv Boys Hostel", 
            unpaiddues: "10000", 
            noofunpaidtenant: "10", 
            todaysCollection: "10000", 
            thisMonthCollection: "1000000", 
            thisMonthExpanse: "1000", 
            onPressed: (){}),

            moneyCard(
            buildingName: "Shiv Boys Hostel", 
            unpaiddues: "10000", 
            noofunpaidtenant: "10", 
            todaysCollection: "10000", 
            thisMonthCollection: "1000000", 
            thisMonthExpanse: "1000", 
            onPressed: (){})
          ],
        ),
      ),

     
    );
  }
}




  Widget _buildFeatureCardList() {
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