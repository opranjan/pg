import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg/controllers/tenantscontroller/tenants_controller.dart';
import 'package:pg/views/pages/People/dashboard/people_dashboard.dart';
import 'package:pg/views/pages/People/team/tenant_screen.dart';

class PeoplePage extends StatefulWidget {
  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AddTenantsController tenantController = Get.put(AddTenantsController());

  @override
  void initState() {
    super.initState();

    // Initialize TabController
    _tabController = TabController(length: 3, vsync: this);

    // Add listener to detect tab changes
    _tabController.addListener(() {
      if (_tabController.index == 1 && _tabController.indexIsChanging) {
        // Call fetchTenants when Tenant Info tab is selected
        tenantController.fetchTenants();
      }
    });
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
          // Custom TabBar at the top
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              color: Colors.white, // TabBar background color
              child: TabBar(
                controller: _tabController, // Assign TabController
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
              controller: _tabController, // Assign TabController
              children: [
                PeopleDashboard(),
                TenantScreen(),
                MaintenanceScreen(),
              ],
            ),
          ),
        ],
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
