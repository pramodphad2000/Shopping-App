import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/utils/snackbar/snackbar.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/button_widget.dart';
import 'package:shoping_app/widgets/text-field_widget.dart';
import 'package:shoping_app/widgets/text_widget.dart';
import 'package:shoping_app/widgets/textbutton_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _shoppingWidgit(),
                      SizedBox(height: 50.h),
                      _loginWidgit(),
                      _textWidget(),
                      SizedBox(height: 50.h),
                      _bootmWidgit(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _shoppingWidgit() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag),
          TextWidget(
            data: AppString.shopping,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  _loginWidgit() {
    return Column(children: [
      Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              data: AppString.login,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30.h),
            Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    data: AppString.phoneText,
                    fontSize: 15.sp,
                  ),
                  const SizedBoxWidget(
                    height: 10.0,
                  ),
                  TextFormFieldWidget(
                    hintText: AppString.enterPhone,
                    keyboardType: TextInputType.number,
                    controller: phoneNumber,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppString.SerachName;
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
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBoxWidget(
        height: 100,
      ),
      SizedBox(
        width: 120.w,
        height: 43.h,
        child: OutlineButtonWidget(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              final phoneNumberText = phoneNumber.text.trim();
              if (phoneNumberText.isNotEmpty) {
                // Handle the OTP sending logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('OTP sent successfully!'),
                    backgroundColor: AppColors.green,
                  ),
                );
                context.push(
                  Routes.otpScreen,
                  extra: {'phoneNumber': phoneNumberText},
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a valid phone number.'),
                  backgroundColor: AppColors.red,
                ),
              );
            }
          },
          text: AppString.start,
        ),
      ),
      const SizedBoxWidget(
        height: 30,
      ),
    ]);
  }

  _textWidget() {
    return const Column(children: [
      TextWidget(
        data: AppString.bycontinuing,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            TextWidget(
              data: AppString.term,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.orangeColor,
            ),
            TextWidget(
              data: AppString.and,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              data: AppString.privacy,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.orangeColor,
            ),
          ],
        ),
      ),
    ]);
  }

  _bootmWidgit() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(
              data: AppString.newTo,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBlue,
            ),
            CustomTextButton(
              onPressed: () {
                context.push(Routes.createAccount);
              },
              text: AppString.create,
            ),
          ],
        ),
      ],
    );
  }
}
