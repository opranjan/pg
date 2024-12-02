import 'package:flutter/material.dart';

Widget customButton({
  required String title,
  required VoidCallback onPressed,
  Color? textColor,
  Color? backgroundColor,
  double? fontSize,
  double? borderRadius = 10.0,
  EdgeInsetsGeometry? padding,
}) {
  return FractionallySizedBox(
    widthFactor: 0.8,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        elevation: 4,
        shadowColor: Colors.orange.withOpacity(0.9),
        animationDuration: Duration(microseconds: 1000)
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}




// Custom TextField Widget with Suffix Icon Over the Line
Widget customTextField() {
  return Stack(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'New Delhi',
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.directions_run, color: Colors.orange),
              SizedBox(width: 8), // Spacing between icons
              Icon(Icons.directions_bus, color: Colors.orange),
            ],
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),

      
      Container(
        child: Positioned(
          right: 10,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.orange),
            borderRadius: BorderRadius.circular(40),
            color: Colors.transparent,
              ),
            child: const Icon(Icons.swap_vert, color: Colors.orange)
            ),
        ),
      ),
    ],
  );
}


