import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';

import 'package:shoping_app/widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      context.push(Routes.createAccount);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
           _imgWidget()
          ],
        ),
      ),
    );
  }
  
  _imgWidget() {
    return Column(
      children: [
         Lottie.asset("assets/logo.json"),
            TextWidget(
              data: AppString.shopping,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            )],
    );
  }
}
