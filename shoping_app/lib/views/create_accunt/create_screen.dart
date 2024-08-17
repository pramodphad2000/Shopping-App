import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/button_widget.dart';
import 'package:shoping_app/widgets/text-field_widget.dart';
import 'package:shoping_app/widgets/text_widget.dart';
import 'package:shoping_app/widgets/textbutton_widget.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                _shoppingWidget(),
                SizedBox(height: 30.h),
                _formWidget(),
                SizedBox(height: 30.h),
                _termsAndConditionsWidget(),
                SizedBox(height: 30.h),
                _bottomWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _shoppingWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_bag),
          SizedBox(width: 5.w),
          TextWidget(
            data: AppString.shopping,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _formWidget() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            data: AppString.createAccunt,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 30.h),
          TextWidget(
            data: AppString.yourText,
            fontSize: 15.sp,
          ),
          SizedBox(height: 10.h),
          TextFormFieldWidget(
            controller: nameController,
            hintText: AppString.enterName,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name.';
              }
              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                return 'Name must contain only letters and spaces.';
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
            ],
          ),
          SizedBoxWidget(height: 20.h),
          TextWidget(
            data: AppString.phoneText,
            fontSize: 15.sp,
          ),
          SizedBoxWidget(height: 10.h),
          TextFormFieldWidget(
            controller: phoneNumberController,
            hintText: AppString.enterPhone,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppString.SerachNumber;
              }
              if (value.length != 10) {
                return AppString.pleaseTextNumeric;
              }
              if (value.contains(RegExp(r'[a-zA-Z]'))) {
                return AppString.pleaseText;
              }
              return null;
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBoxWidget(height: 20.h),
          TextWidget(
            data: AppString.gender,
            fontSize: 15.sp,
          ),
          SizedBoxWidget(height: 10.h),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: AppString.seletGender,
              border: OutlineInputBorder(),
            ),
            value: _selectedGender,
            icon: const Icon(Icons.keyboard_arrow_down),
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue;
              });
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a gender';
              }
              return null;
            },
          ),
          SizedBox(height: 50.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: OutlineButtonWidget(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final phoneNumberText = phoneNumberController.text.trim();
                  if (phoneNumberText.isNotEmpty) {
                    // You can integrate the OTP sending logic here
                  }
                }
              },
              text: AppString.continu,
            ),
          ),
        ],
      ),
    );
  }

  Widget _termsAndConditionsWidget() {
    return Column(
      children: [
        TextWidget(
          data: AppString.bycontinuing,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                data: AppString.term,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.orangeColor,
              ),
              SizedBoxWidget(width: 5.w),
              TextWidget(
                data: AppString.and,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBoxWidget(width: 5.w),
              TextWidget(
                data: AppString.privacy,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.orangeColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          data: AppString.existing,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue,
        ),
        CustomTextButton(
          onPressed: () {
            context.push(Routes.loginScreen);
          },
          text: AppString.login,
        ),
      ],
    );
  }
}
