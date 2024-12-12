import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/bottom_nav_controller.dart';
import 'package:pg/controllers/floorcontroller/addfloor_controller.dart';
import 'package:pg/controllers/propertycontroller/new_property_form_controller.dart';
import 'package:pg/views/pages/Money/money_page.dart';
import 'package:pg/views/pages/People/people_page.dart';
import 'package:pg/views/pages/Building/building_page.dart';
import 'package:pg/views/pages/home_page.dart';
import 'package:pg/views/widgets/app_bar.dart';
import 'package:pg/views/widgets/bottom_modal.dart';
import 'package:pg/views/widgets/mainappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  // Define the pages
  final List<Widget> pages = [
    HomePage(),
    MoneyPage(),
    SizedBox(),
    PeoplePage(),
    BuildingPage(),
  ];

  // Page controller for smooth page transition
  final PageController _pageController = PageController();

  // Function to open the bottom modal
  void _openBottomModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),

      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: BottomModal(),
        );
      },
    );
  }



  // Helper function to create items with both icon and text
  Widget _bottomNavItem(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(PropertyFormController());
    
    return Scaffold(
      appBar: mainAppBar(
        context,
        "Select Property",
        titleObservable: propertyController.propertyNameObs,
       isIcon: false,
       onpress: ()async{
        print("clicked..");
          propertyController.fetchProperties();
         

          print("roomname ");
          _openBottomModal();
       }
      ),
      body: NotificationListener<ScrollStartNotification>(
        onNotification: (notification) {
          return true; // Block scroll notifications to disable swiping
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            bottomNavController.changePage(index);
          },
          physics: NeverScrollableScrollPhysics(), // Disable swipe gestures
          children: pages,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        height: 65,
        animationDuration: Duration(milliseconds: 400),
        index: bottomNavController.selectedIndex.value,
        onTap: (index) {
          if (index == 2) {
            _openBottomModal();
          } else {
            _pageController.jumpToPage(index);
            bottomNavController.changePage(index);
          }
        },
        items: <Widget>[
          _bottomNavItem(Icons.home, 'Home'),
          _bottomNavItem(Icons.currency_exchange, 'Money'),
          _bottomNavItem(Icons.add, 'Add'),
          _bottomNavItem(Icons.person, 'People'),
          _bottomNavItem(Icons.apartment, 'Building'),
        ],
      ),
    );
  }
}
