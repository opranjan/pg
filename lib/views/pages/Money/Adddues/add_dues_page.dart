import 'package:flutter/material.dart';
import 'package:pg/views/widgets/app_bar.dart';

class AddDuesPage extends StatefulWidget {
  const AddDuesPage({super.key});

  @override
  _AddDuesPageState createState() => _AddDuesPageState();
}

class _AddDuesPageState extends State<AddDuesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with 2 tabs
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "Add Dues"),
      body: Column(
        children: [
          // TabBar for Room and Tenants
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Room'),
              Tab(text: 'Tenants'),
            ],
            labelColor: Colors.blueAccent, // Color for the selected tab
            unselectedLabelColor: Colors.grey, // Color for unselected tabs
            indicatorColor: Colors.blueAccent, // Color for the indicator
          ),
          // TabBarView for displaying content based on the selected tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Room Tab Content
                Center(
                  child: Text('Room '),
                ),
                // Tenants Tab Content
                Center(
                  child: Text('Tenants'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
