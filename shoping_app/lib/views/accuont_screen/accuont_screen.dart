import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/button_widget.dart';
import 'package:shoping_app/widgets/custom_Bottom_NavigationBar.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class AccuntScreen extends StatefulWidget {
  const AccuntScreen({super.key});

  @override
  State<AccuntScreen> createState() => _AccuntScreenState();
}

class _AccuntScreenState extends State<AccuntScreen> {
  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textWidget(),
              const SizedBoxWidget(
                height: 20,
              ),
              _buttonWidget(),
              const SizedBoxWidget(
                height: 20,
              ),
              _accuntWidget(),
              const SizedBoxWidget(
                height: 40,
              ),
              _logoutWidget()
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

  _textWidget() {
    return const Column(
      children: [
        TextWidget(
          data: AppString.hey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
          data: AppString.explore,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  _buttonWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 147.w,
                height: 43.h,
                child: OutlineButtonWidget(
                  onPressed: () {},
                  text: AppString.order,
                  iconData: Icons.shopping_cart,
                  labelFontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  borderRadius: 8.0,
                  buttonWidth: 150.w,
                  buttonHeight: 50.h,
                  labelColor: MaterialStateProperty.all(AppColors.white),
                ),
              ),
              SizedBox(
                width: 147.w,
                height: 43.h,
                child: OutlineButtonWidget(
                  onPressed: () {},
                  text: AppString.wishlist,
                  iconData: Icons.heat_pump,
                  labelFontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  borderRadius: 8.0,
                  buttonWidth: 150.w,
                  buttonHeight: 50.h,
                  labelColor: MaterialStateProperty.all(AppColors.white),
                ),
              ),
            ],
          ),
          SizedBoxWidget(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 147.w,
                height: 43.h,
                child: OutlineButtonWidget(
                  onPressed: () {},
                  text: AppString.coupons,
                  iconData: Icons.card_giftcard_rounded,
                  labelFontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  borderRadius: 8.0,
                  buttonWidth: 150.w,
                  buttonHeight: 50.h,
                  labelColor: MaterialStateProperty.all(AppColors.white),
                ),
              ),
              SizedBox(
                width: 147.w,
                height: 43.h,
                child: OutlineButtonWidget(
                  onPressed: () {},
                  text: AppString.helpCenter,
                  iconData: Icons.headset_outlined,
                  labelFontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  borderRadius: 8.0,
                  buttonWidth: 150.w,
                  buttonHeight: 50.h,
                  labelColor: MaterialStateProperty.all(AppColors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _accuntWidget() {
    return Container(
      height: 300.h,
      width: 350.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          const TextWidget(
            data: AppString.accuntSetting,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.accountInfo);
                },
                child: const Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    TextWidget(
                      data: AppString.editProfile,
                      fontSize: 18.0,
                    ),
                  ],
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.language),
                SizedBoxWidget(
                  width: 10,
                ),
                TextWidget(
                  data: AppString.selectLanguage,
                  fontSize: 18.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.notifications),
                SizedBoxWidget(
                  width: 10,
                ),
                TextWidget(
                  data: AppString.notification,
                  fontSize: 18.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.reviews),
                SizedBoxWidget(
                  width: 10,
                ),
                TextWidget(
                  data: AppString.reviews,
                  fontSize: 18.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.question_answer),
                SizedBoxWidget(
                  width: 10,
                ),
                TextWidget(
                  data: AppString.questions,
                  fontSize: 18.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.policy_outlined),
                SizedBoxWidget(
                  width: 10,
                ),
                TextWidget(
                  data: AppString.terms,
                  fontSize: 18.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _logoutWidget() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 190.w,
            height: 43.h,
            child: OutlineButtonWidget(
              onPressed: () {
                context.push(Routes.splashScreen);
              },
              text: AppString.logOut,
              borderRadius: 8.0,
              buttonWidth: 150.w,
              buttonHeight: 50.h,
              borderColor: AppColors.orangeColor,
              textColor: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
