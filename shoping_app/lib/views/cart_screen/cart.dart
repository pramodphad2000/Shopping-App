import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_image.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/button_widget.dart';
import 'package:shoping_app/widgets/custom_Bottom_NavigationBar.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _shoppingtext(),
              const SizedBox(height: 40),
              _mycartWidget(),
              const SizedBox(height: 60),
              _cartMissingWidget(),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

  _shoppingtext() {
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

  _cartMissingWidget() {
    return Column(
      children: [
        const TextWidget(
          data: AppString.missingcartitems,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.green,
        ),
        SizedBoxWidget(height: 30),
        SizedBox(
          width: 120.w,
          height: 43.h,
          child: OutlineButtonWidget(
            onPressed: () {
              context.push(Routes.loginScreen);
            },
            text: AppString.login,
            borderRadius: 5.0,
            buttonWidth: 120.w,
            buttonHeight: 30.h,
          ),
        ),
        SizedBoxWidget(height: 30),
        TextWidget(
          data: AppString.continueshopping,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: AppColors.darkBlue,
        )
      ],
    );
  }

  _mycartWidget() {
    return Column(
      children: [
        const TextWidget(
          data: AppString.mycart,
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
        Lottie.asset(AppImages.cart, height: 150.h)
      ],
    );
  }
}
