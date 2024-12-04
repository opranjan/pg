import 'package:flutter/material.dart';
import 'package:pg/views/pages/Building/floor/add_floor.dart';
import 'package:pg/views/pages/Building/dashboard/property_dashboard.dart';
import 'package:pg/views/pages/Building/room/rooms_screen_building.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({super.key});

  @override
  _BuildingPageState createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom TabBar at the top without AppBar
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              color: Colors.white, // Customize tab bar color
              width: double.infinity, // Ensure it takes up the full width
              child: TabBar(
                isScrollable: true, // Allow the tabs to be scrollable if they don't fit
                controller: _tabController,
                tabs: [
                  Tab(child: Text('Dashboard')),
                  Tab(child: Text('Floors')),
                  Tab(child: Text('Rooms')),
                  Tab(child: Text('Listing')),
                ],
              ),
            ),
          ),
          // TabBarView displaying content for each tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PropertyDashboard(),
                AddFloor(),
                RoomsScreen(),
                ListingScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Screen for the Listing tab
class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Listing Content'),
    );
  }
}
