import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/TenantController/TenantController.dart';
import 'package:pg/views/pages/People/dashboard/people_dashboard.dart';
import 'package:pg/views/pages/People/team/tenant_screen.dart';

class PeoplePage extends StatelessWidget {
  final TenantController controller = Get.put(TenantController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Define the number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // Custom TabBar at the top
            PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                color: Colors.white, // TabBar background color
                child: TabBar(
                  isScrollable: true, // Allow the tabs to be scrollable
                  tabs: [
                    Tab(child: Text('Dashboard')),
                    Tab(child: Text('Tenant Info')),
                    Tab(child: Text('Team')),
                  ],
                ),
              ),
            ),
            // TabBarView displaying content for each tab
            Expanded(
              child: TabBarView(
                children: [
                  PeopleDashboard(),
                  TenantScreen(),
                  MaintenanceScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen for the Dashboard tab
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Screen for the Tenant Info tab
class TenantInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tenant Info Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Screen for the Maintenance tab
class MaintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Maintenance Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
