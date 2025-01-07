import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/constants/api_service.dart';
import 'package:pg/controllers/duescontroller/dues_controller.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final propertyController = Get.put(PropertyFormController());
   final tenantsController = Get.put(AddTenantsController());
   final duesController  = Get.put(DuesController());



   double totalAmount = 0;





  final ApiService apiService = ApiService();
  Map<String, dynamic>? overviewData;
  bool isLoading = true;
  String errorMessage = '';


  @override
  void initState() {
    super.initState();
    duesController.fetchDues();

    duesController.dueslist.map((element) => element.amount);

    fetchBuildingOverview();
    
  }





    Future<void> fetchBuildingOverview() async {
    try {
      final data = await apiService.fetchOverview(propertyController.propertyNameObs.value.toString());
      setState(() {
        overviewData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }


   // Sum all dues amounts
  void calculateTotalAmount() {
    totalAmount = duesController.dueslist.fold(0.0, (sum, item) => sum + (double.parse(item.amount) ?? 0.0));
    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
      // Calculate total amount after dueslist is updated
    if (duesController.dueslist.isNotEmpty) {
      calculateTotalAmount();
    }

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


                Text("Today Collection: ${overviewData!['today_collection']}"),

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
                      _buildPropertyCardList(propertyController.properties.length.toString(), '0', '0'),
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
                      _buildPeopleCardList(tenantsController.tenantlist.length.toString(), "1", "0"),
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
                      _buildMoneyCardList("${overviewData!['today_collection']}", " ${overviewData!['monthly_collection']}", "${overviewData!['total_month_dues']}", "${overviewData!['past_total_dues']}"),
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

  Widget _buildPropertyCardList(String totalProperties, String totalBookings, String totalPendingBooking) {
    // Example data for the horizontal list
     final List<Map<String, dynamic>> items = [
    {"title": "Total Properties", "data": totalProperties, "iconColor": Colors.blue,  "iconname":Icons.apartment},
    {"title": "Total Bookings", "data": totalBookings, "iconColor": Colors.blue,  "iconname":Icons.apartment},
    {"title": "Pending Bookings", "data": totalPendingBooking, "iconColor": Colors.red,  "iconname":Icons.apartment},
  ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: featureCard(
              icon:items[index]["iconname"]!,
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
  Widget _buildPeopleCardList(String totalTenants, String totalStaff, String totalExpense) {
  // Example data for the horizontal list
  final List<Map<String, dynamic>> items = [
    {"title": "Total Tenants", "data": totalTenants, "iconColor": Colors.blue, "iconname":Icons.person},
    {"title": "Total Team/ Staff", "data": totalStaff, "iconColor": Colors.green,"iconname":Icons.person},
    {"title": "Expense", "data": totalExpense, "iconColor": Colors.red,"iconname":Icons.currency_exchange},
  ];

  return Container(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: featureCard(
            icon: items[index]['iconname'],
            title: items[index]["title"]!,
            data: items[index]["data"]!,
            iconColor: items[index]["iconColor"], // Ensure the correct key is used here
          ),
        );
      },
    ),
  );
}





  Widget _buildMoneyCardList(String todayCollection, String monthCollection, String totalDues, String monthDues) {
    // Example data for the horizontal list
    final List<Map<String, dynamic>> items = [
      {"title": "Today's Collection", "data": todayCollection, "iconColor": Colors.green,  "iconname":Icons.currency_rupee},
      {"title": "Month Collection ", "data": monthCollection, "iconColor": Colors.green, "iconname":Icons.currency_rupee},
      {"title": "Total Dues", "data": totalDues, "iconColor": Colors.red, "iconname":Icons.currency_rupee},
      {"title": "Month Dues", "data": monthDues, "iconColor": Colors.red, "iconname":Icons.currency_rupee},
    ];

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: featureCard(
              icon: items[index]['iconname'],
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
