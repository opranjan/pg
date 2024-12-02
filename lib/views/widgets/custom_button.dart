import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback onPressed; // Button click callback
  final Color? color; // Button background color
  final Color? textColor; // Text color
  final double? borderRadius; // Corner radius
  final EdgeInsetsGeometry? padding; // Padding inside button
  final Widget? icon; // Optional icon
  final TextStyle? textStyle; // Custom text style
  final double? elevation; // Shadow elevation
  final double? width; // Button width
  final double? height; // Button height

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.icon,
    this.textStyle,
    this.elevation,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          foregroundColor: textColor ?? Colors.white,
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
          elevation: elevation ?? 2.0,
        ),
        child: icon == null
            ? Text(
                text,
                style: textStyle ?? TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  SizedBox(width: 8.0),
                  Text(
                    text,
                    style: textStyle ?? TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}
