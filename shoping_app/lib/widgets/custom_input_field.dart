import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String textAboveField;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?) validator;

  CustomInputField({
    required this.textAboveField,
    required this.controller,
    required this.inputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAboveField,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: controller,
              keyboardType: inputType,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
