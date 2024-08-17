import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class Buy extends StatefulWidget {
  const Buy({super.key});

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18.h),
              _buildDeliveryContainer(),
              SizedBox(height: 12.h),
              _buildProductDetailsContainer(),
              SizedBox(height: 10.h),
              _buildPriceDetailsContainer(),
              SizedBox(height: 10.h),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black,
            width: 1.5.w,
          ),
        ),
        child: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 27.sp,
              ),
              SizedBox(width: 50.w),
              const TextWidget(
                data: AppString.summary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildDeliveryContainer() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black,
          width: 1.5.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDeliveryHeader(),
            _buildDeliveryDetails(),
          ],
        ),
      ),
    );
  }

  _buildDeliveryHeader() {
    return Row(
      children: [
        TextWidget(
          data: AppString.deliver,
          fontSize: 19.sp,
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: AppColors.green,
              width: 1.5.w,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const TextWidget(
            data: AppString.change,
            color: AppColors.green,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  _buildDeliveryDetails() {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              data: "Tushar Dushing",
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 20.w),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.grey,
                  width: 1.5.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const TextWidget(
                data: AppString.home,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextWidget(
              data:
                  "Ekata darshan so room no:203, Bramhanalli, near,\nNeral vidha vikas school mage, Neral 410101",
              fontSize: 14.sp,
            ),
          ],
        ),
        Row(
          children: [
            TextWidget(
              data: "7058056059",
              fontSize: 14.sp,
            ),
          ],
        ),
      ],
    );
  }

  _buildProductDetailsContainer() {
    return Container(
      height: 310.h,
      width: 360.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              data: AppString.productDetails,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            _buildProductDetails(),
          ],
        ),
      ),
    );
  }

  _buildProductDetails() {
    return Row(
      children: [
        Image.asset(
          "assets/download.png",
          height: 110.h,
        ),
        SizedBox(width: 15.w),
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                data: "KRIVITY",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              TextWidget(
                data: "Embroidered Bollywood cotton",
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              _buildPriceRow(),
              SizedBox(height: 10.h),
              _buildProductAttributes(),
            ],
          ),
        ),
      ],
    );
  }

  _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '₹1,999',
          style: TextStyle(
            fontSize: 20,
            color: AppColors.black,
            decoration: TextDecoration.lineThrough,
            decorationThickness: 2.5,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: AppColors.black,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        TextWidget(
          data: "₹499",
          fontSize: 20.sp,
        ),
        SizedBox(width: 10.w),
        TextWidget(
          data: "38% Off",
          fontSize: 20.sp,
          color: AppColors.green,
        ),
      ],
    );
  }

  _buildProductAttributes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAttributeRow("Style Code :-", "Embroide_cotton"),
        _buildAttributeRow("Secondary Color :-", "Red"),
        _buildAttributeRow("Decorative Material:-", "Mirror"),
        _buildAttributeRow("Fabric Care:-", "Print/Embroidery"),
      ],
    );
  }

  _buildAttributeRow(String title, String value) {
    return Row(
      children: [
        TextWidget(
          data: title,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
          data: value,
          fontSize: 12.sp,
        ),
      ],
    );
  }

  _buildPriceDetailsContainer() {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black,
          width: 1.5.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            TextWidget(
              data: AppString.pricedts,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            _buildPriceDetailsRow(AppString.priceitem, "₹499"),
            SizedBox(height: 7.h),
            _buildPriceDetailsRow(AppString.discount, "₹1,999"),
            SizedBox(height: 7.h),
            _buildPriceDetailsRow(AppString.deliverycharges, "Free Delivery",
                color: AppColors.green),
            SizedBox(height: 7.h),
            Divider(
              height: 20.h,
              thickness: 2,
              color: AppColors.black,
            ),
            _buildPriceDetailsRow(AppString.totalamount, "₹499"),
          ],
        ),
      ),
    );
  }

  _buildPriceDetailsRow(String title, String value, {Color? color}) {
    return Row(
      children: [
        TextWidget(
          data: title,
          fontSize: 16.sp,
        ),
        const Spacer(),
        TextWidget(
          data: value,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ],
    );
  }

  _buildActionButton() {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black,
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Column(
                  children: [
                    TextWidget(
                      data: "₹499",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      data: AppString.viewpd,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ],
                ),
                SizedBox(width: 62.w),
                OutlinedButton(
                  onPressed: () {
                    context.push(Routes.payment);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.black,
                      width: 1.5.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const TextWidget(
                    data: AppString.continu,
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
