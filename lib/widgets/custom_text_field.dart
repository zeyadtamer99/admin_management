import 'package:admin_management/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData? endIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Rx<String?>? errorText;
  final double? width;
  final double? height;

  CustomTextField({
    required this.title,
    required this.hintText,
    this.endIcon,
    this.onChanged,
    this.validator,
    this.controller,
    this.errorText,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: AppFontSizes.small, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Container(
          width: width, // Use the width parameter
          height: height, // Use the height parameter
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              suffixIcon: endIcon != null ? Icon(endIcon) : null,
              errorText: errorText?.value,
            ),
            onChanged: onChanged,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
