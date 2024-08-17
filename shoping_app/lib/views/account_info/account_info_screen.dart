import 'package:flutter/material.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/widgets/custom_input_field.dart';

import 'package:shoping_app/widgets/text_widget.dart';

class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: TextWidget(data: AppString.formSaved)));
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.fieldRequired;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.fieldRequired;
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return AppString.enterValidEmail;
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.fieldRequired;
    }
    if (value.length != 10) {
      return AppString.enterValidPhone;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const TextWidget(data: AppString.accountInformation),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppColors.grey,
              height: 1.0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInputField(
                  textAboveField: AppString.firstName,
                  controller: _firstNameController,
                  inputType: TextInputType.text,
                  validator: _validateNotEmpty,
                ),
                CustomInputField(
                  textAboveField: AppString.lastName,
                  controller: _lastNameController,
                  inputType: TextInputType.text,
                  validator: _validateNotEmpty,
                ),
                CustomInputField(
                  textAboveField: AppString.telephoneNumber,
                  controller: _phoneController,
                  inputType: TextInputType.phone,
                  validator: _validatePhone,
                ),
                CustomInputField(
                  textAboveField: AppString.emailId,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: _saveForm,
                      child: const TextWidget(
                        data: AppString.save,
                        color: AppColors.white                       
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
