import 'package:flutter/material.dart';
import 'package:pg/views/pages/Money/collection/money_collection.dart';
import 'package:pg/views/pages/Money/tabscreen/add_money_dues.dart';
import 'package:pg/views/pages/Money/tabscreen/money_dues.dart';
import 'package:pg/views/pages/Money/tabscreen/money_overview.dart';
import 'package:pg/views/pages/Building/room/rooms_screen_building.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this); // 6 tabs
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    // Synchronize the TabBar with the TabBarView when swiping
    if (_tabController.indexIsChanging) {
      setState(() {}); // Update the state to reflect the indicator change
    }
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
              child: TabBar(
                isScrollable: true, // Allow the tabs to be scrollable
                controller: _tabController,
                tabs: [
                  Tab(child: Text('Overview')),
                  Tab(child: Text('Add Dues')),
                  Tab(child: Text('Dues')),
                  Tab(child: Text('Collection')),
                  // Tab(child: Text('Expense')),
                  Tab(child: Text('Reports')),
                ],
              ),
            ),
          ),
          // TabBarView displaying content for each tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MoneyOverview(),
                AddMoneyDues(),
                MoneyDues(),
                MoneyCollection(),
                // FoodScreen(),
                FoodScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Reports screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
