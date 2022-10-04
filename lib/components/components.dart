
import 'package:flutter/material.dart';

TextFormField buildTextFormField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required Widget icon,
  required bool isPassword,
  required bool secure,
  required String? Function(String?) validator,
  Widget? suffixIcon
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword&&secure? true:false,
    validator: validator,
    decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        focusColor: Colors.grey,
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.deepOrange)),
        prefixIcon: icon,
        contentPadding: const EdgeInsets.all(25),
        prefixIconColor: Colors.teal,
        suffixIcon: suffixIcon,

        floatingLabelStyle: TextStyle(
          color: Colors.deepOrange,
        )
    ),
  );
}