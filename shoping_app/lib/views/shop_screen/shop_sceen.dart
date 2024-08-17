import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key, required String itemName});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImages(),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(data: AppString.color),
                  SizedBox(height: 5),
                  TextWidget(data: AppString.availableColors),
                ],
              ),
              const SizedBox(height: 10),
              _buildColorOptions(),
              const SizedBox(height: 10),
              Expanded(
                child: _buildProductDetails(),
              ),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

   _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: Container(
        alignment: Alignment.topCenter,
        height: 39,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: AppColors.white, // Use custom AppColors class
          borderRadius: BorderRadius.zero,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: AppString.searchHint,
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.mic),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    );
  }

   _buildProductImages() {
    return Row(
      children: [
        Expanded(
          child:
              Image.asset('assets/sadi.jpg'), // Replace with your image asset
        ),
        Expanded(
          child: Image.asset(
              'assets/sadi_details.jpg'), // Replace with your image asset
        ),
      ],
    );
  }

   _buildColorOptions() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of colors
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Image.asset('assets/color4.png'),
          );
        },
      ),
    );
  }

   _buildProductDetails() {
    return ListView(
      children: const [
        TextWidget(
            data: AppString.productDetails,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        SizedBox(height: 10),
        TextWidget(
            data: 'Style Code: Embroidered Bollywood Cotton Linen Saree'),
        TextWidget(data: 'Pattern: Embroidered'),
        TextWidget(data: 'Pack of: 1'),
        TextWidget(data: 'Secondary Color: Red'),
        TextWidget(
            data:
                'Occasions: Casual, Party & Festive, Wedding, Wedding & Festive'),
        TextWidget(data: 'Decorative Material: Mirror'),
        TextWidget(data: 'Embroidery Method: Machine'),
        TextWidget(
            data: 'Fabric Care: Do not iron on print/embroidery/embellishment'),
      ],
    );
  }

   _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.white, // Background color for "Add to cart"
              side: const BorderSide(color: AppColors.black), // Border color
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Square corners
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 16), // Padding inside the button
            ),
            child: const TextWidget(
              data: AppString.addToCart,
              color: AppColors.black, // Text color for "Add to cart"
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
                context.push(Routes.buy);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.black, // Background color for "Buy Now"
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Square corners
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 16), // Padding inside the button
            ),
            child: const TextWidget(
              data: AppString.buyNow,
              color: AppColors.white, // Text color for "Buy Now"
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
