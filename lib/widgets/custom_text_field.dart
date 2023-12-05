import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData? endIcon; // Nullable endIcon parameter
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Rx<String?>? errorText; // Observable error text

  CustomTextField({
    required this.title,
    required this.hintText,
    this.endIcon,
    this.onChanged,
    this.validator,
    this.controller,
    this.errorText, // Now required
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Obx(() => TextFormField( // Wrapped with Obx for reactivity
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
            suffixIcon: endIcon != null ? Icon(endIcon) : null,
            errorText: errorText?.value, // Display the error text
          ),
          onChanged: onChanged,
          validator: validator,
        )),
      ],
    );
  }
}
