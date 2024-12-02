import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20, // Handle keyboard overlap
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text(
            'Explore PG',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          
          // Search Box
          TextField(
            decoration: InputDecoration(
              labelText: 'Search...',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 20),

          // Scrollable Area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Actions Section
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  
                  // Admin Dashboard Action
                  _buildActionItem(
                    icon: Icons.dashboard,
                    label: 'Admin Dashboard',
                    onPressed: () {
                      // Handle Admin Dashboard action
                      Navigator.pop(context);  // Example action
                    },
                  ),
                  SizedBox(height: 10),

                  // Send Message Action
                  _buildActionItem(
                    icon: Icons.message,
                    label: 'Send Message',
                    onPressed: () {
                      // Handle Send Message action
                      Navigator.pop(context);  // Example action
                    },
                  ),
                  SizedBox(height: 10),

                  // Change Property Action
                  _buildActionItem(
                    icon: Icons.home_repair_service,
                    label: 'Change Property',
                    onPressed: () {
                      // Handle Change Property action
                      Navigator.pop(context);  // Example action
                    },
                  ),
                  SizedBox(height: 10),

                  // Invite Tenant Action
                  _buildActionItem(
                    icon: Icons.person_add,
                    label: 'Invite Tenant',
                    onPressed: () {
                      // Handle Invite Tenant action
                      Navigator.pop(context);  // Example action
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build each action item with icon and label
  Widget _buildActionItem({required IconData icon, required String label, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.orange),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
