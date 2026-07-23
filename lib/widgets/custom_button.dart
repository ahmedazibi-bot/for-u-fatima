/// Custom Button Widget
/// Author: AZIBI AHMED
/// Beautiful, rounded button with soft pink theme

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Button background color (default: soft pink)
  final Color backgroundColor;

  /// Button text color
  final Color textColor;

  /// Button width (optional)
  final double? width;

  /// Button height
  final double height;

  /// Button icon (optional)
  final IconData? icon;

  /// Creates a CustomButton
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFFFB6C1), // Light pink
    this.textColor = Colors.white,
    this.width,
    this.height = 55,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgroundColor,
                  backgroundColor.withOpacity(0.85),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor, size: 22),
                  const SizedBox(width: 10),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
