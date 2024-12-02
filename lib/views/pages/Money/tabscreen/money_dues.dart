import 'package:flutter/material.dart';
import 'package:pg/views/widgets/cards/feature_card.dart';

class MoneyDues extends StatelessWidget {
  const MoneyDues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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



            duesCard(tenantName: "John Doe", tenantDues: "₹10000", duesDate: "30-11-24"),

             duesCard(tenantName: "John Doe", tenantDues: "₹10000", duesDate: "30-11-24"),
              duesCard(tenantName: "John Doe", tenantDues: "₹10000", duesDate: "30-11-24"),
               duesCard(tenantName: "John Doe", tenantDues: "₹10000", duesDate: "30-11-24"),

          ],
        ),
      ),
    );
  }
}
