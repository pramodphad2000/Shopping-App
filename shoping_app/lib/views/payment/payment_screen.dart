import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/widgets/button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.close),
          actions: [
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {},
            ),
          ],
          elevation: 0,
          backgroundColor: AppColors.white,
          iconTheme: const IconThemeData(color: AppColors.textDarkBlack),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Rp 499.000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDarkBlack,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                AppString.detail,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDarkBlack,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.priceitem,
                        style: TextStyle(color: AppColors.textColour)),
                    Text('₹4.99', style: TextStyle(color: AppColors.textColour)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.discount,
                        style: TextStyle(color: AppColors.textColour)),
                    Text('₹1,999', style: TextStyle(color: AppColors.textColour)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.deliverycharges,
                        style: TextStyle(color: AppColors.textColour)),
                    Text(
                      'Free Delivery',
                      style: TextStyle(
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.amount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDarkBlack,
                      ),
                    ),
                    Text(
                      '₹499',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDarkBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 43.h,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    text: AppString.done,
                    backgroundColor: Color.fromARGB(146, 0, 251, 113),
                    textColor: AppColors.white,
                    borderRadius: 0.0,
                    buttonHeight: 43.h,
                    buttonWidth: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
