import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_sizes.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/button_widget.dart';
import 'package:shoping_app/widgets/text_widget.dart';
import 'package:shoping_app/widgets/textbutton_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, this.phoneNumber, String? token})
      : super(key: key);
  final String? phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.h),
          child: Form(
            key: formKey, // Added Form widget
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _shoppingWidget(),
                        SizedBox(height: 50.h),
                        _loginWidget(),
                        _textWidget(),
                        SizedBox(height: 50.h),
                        _bottomWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _shoppingWidget() {
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

  _loginWidget() {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            context: context,
            data: AppString.enterYourOtp,
            color: AppColors.grayColour,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
          SizedBox(
            height: 15.h,
          ),
          Pinput(
            obscureText: true,
            obscuringCharacter: AppString.obsureOtpText,
            obscuringWidget: TextWidget(
              context: context,
              data: AppString.obsureOtpText,
              fontSize: AppSizes.heavy18pxTextSize,
              color: Theme.of(context).primaryColor,
            ),
            closeKeyboardWhenCompleted: true,
            keyboardType: TextInputType.number,
            controller: _otpController,
            validator: (value) { // Added validator
              if (value == null || value.isEmpty) {
                return 'Please enter the OTP';
              } else if (value.length != 6) {
                return 'OTP must be 6 digits';
              }
              return null;
            },
            focusedPinTheme: PinTheme(
                height: AppSizes.height(45),
                width: AppSizes.width(32),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.4),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(0.r))),
            defaultPinTheme: PinTheme(
              height: AppSizes.height(45),
              width: AppSizes.width(32),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.4),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(0.r),
              ),
            ),
            length: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: CustomTextButton(
              onPressed: () {
                context.push(Routes.loginScreen);
              },
              text: AppString.recend,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      const SizedBoxWidget(
        height: 70,
      ),
      SizedBox(
        width: 120.w,
        height: 43.h,
        child: OutlineButtonWidget(
          onPressed: () { 
            if (formKey.currentState?.validate() == true) {
           
                context.push(Routes.homeScreen);
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
            )
          ],
        ),
      )
    ]);
  }

  _bottomWidget() {
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
            )
          ],
        ),
      ],
    );
  }
}
