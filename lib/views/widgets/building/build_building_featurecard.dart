    import 'package:flutter/material.dart';

Widget buildBuildingFeatureCard({
    required IconData icon,
    required String title,
    required String data,
  }) {
    return Container(
      width: 150, // Fixed width for each card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
    
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, 1), // Soft shadow for depth
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Data above icon and title
            Text(
              '₹ $data',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(
                    255, 1, 117, 67),
              ),
            ),
            const SizedBox(height: 5),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
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
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    size: 25,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }