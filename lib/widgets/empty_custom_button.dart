import 'package:admin_management/constants/constants.dart';
import 'package:flutter/material.dart';

class TitleCustomButton extends StatelessWidget {
  final String text;
  final String? subtitle; // Nullable subtitle parameter
  final IconData? icon;
  final VoidCallback onPressed;
  final Color borderColor; // Border color parameter
  final Color buttonColor; // Button color parameter
  final double width; // Width parameter
  final double height; // Height parameter
  final double textSize; // Text size parameter
  final FontWeight? fontWeight;
  bool isSelected;

  TitleCustomButton({
    required this.text,
    this.subtitle, // Subtitle might not be passed
    this.icon,
    required this.onPressed,
    this.borderColor = Colors.grey, // Default value is grey
    this.buttonColor = Colors.white, // Default value is white
    required this.width,
    required this.height,
    required this.textSize,
    this.fontWeight,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isSelected ? AppColors.primaryColor : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
          side: BorderSide(color: borderColor, width: 1.5), // Use border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Curved edges
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: icon == null ? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceBetween,
             children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: icon == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
              Text(
                text,
                style: TextStyle(fontSize: textSize, fontWeight: fontWeight), // Use text size and weight
              ),
              if (subtitle != null) Text(subtitle!),
            ],),
              if (icon != null) Icon(icon),
          ],
        ),
      ),
    );
  }
}
