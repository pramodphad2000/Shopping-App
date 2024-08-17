import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_sizes.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/widgets/app_size.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int selectedCategoryIndex = -1;

  List<String> categories = [
    'For you',
    'Fashion',
    'Mobile',
    'Laptops',
    'Cars',
    'Electronic',
    'Fashion',
    'Mobile',
    'Laptops',
    'Cars',
    'Electronic',
    'Fashion',
    'Mobile',
    'Laptops',
    'Cars',
    'Electronic',
    'Fashion',
    'Mobile',
    'Laptops',
    'Cars',
    'Electronic',
  ];

  Map<String, List<Map<String, String>>> productsByCategory = {
    'For you': [
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
    'Fashion': [
      {'image': 'assets/shoes.png', 'name': 'Offer Zone'},
      {'image': 'assets/watch.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
    'Mobile': [
      {'image': 'assets/bag.png', 'name': 'Offer Zone'},
      {'image': 'assets/elec.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
    'Laptops': [
      {'image': 'assets/kids.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
    'Cars': [
      {'image': 'assets/rect3.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect4.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
    'Electronic': [
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect5.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect6.png', 'name': 'Offer Zone'},
      {'image': 'assets/rect1.png', 'name': 'Popular Store'},
      {'image': 'assets/rect2.png', 'name': 'Offer Zone'},
    ],
  };

  @override
   build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.categoriesName),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_checkout),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                ),
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return _CategoryItem(
                      isSelected: selectedCategoryIndex == index,
                      categoryName: categories[index],
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBoxWidget(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                  ),
                  child: selectedCategoryIndex == -1
                      ? const _PlaceholderText()
                      : ListView.builder(
                          itemCount: (productsByCategory[
                                          categories[selectedCategoryIndex]]!
                                      .length +
                                  3) ~/
                              4,
                          itemBuilder: (context, rowIndex) {
                            int startIndex = rowIndex * 4;
                            int endIndex = startIndex + 4;
                            var productRow = productsByCategory[
                                    categories[selectedCategoryIndex]]!
                                .sublist(
                                    startIndex,
                                    endIndex >
                                            productsByCategory[categories[
                                                    selectedCategoryIndex]]!
                                                .length
                                        ? productsByCategory[categories[
                                                selectedCategoryIndex]]!
                                            .length
                                        : endIndex);

                            return _ProductRow(productRow: productRow);
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   _ProductRow({required List<Map<String, String>> productRow}) {
    return Row(
      children: productRow.map((product) {
        return Expanded(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(product['image']!),
                backgroundColor: AppColors.grey,
              ),
              SizedBoxWidget(height: 5),
              Text(
                product['name']!,
                style: TextStyle(
                  fontSize: AppSizes.lightTextSize,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String categoryName;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.isSelected,
    required this.categoryName,
    required this.onTap,
  });

  @override
   build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        color: isSelected ? AppColors.grey : Colors.transparent,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: categoryName == Text(AppString.foryouText)
                  ? const Icon(Icons.person, color: AppColors.grey)
                  : Image.asset('assets/layer1.png'),
            ),
            SizedBoxWidget(height: 5),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: AppSizes.const12pxTextSize,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderText extends StatelessWidget {
  const _PlaceholderText();

  @override
   build(BuildContext context) {
    return Center(
      child: Text(
        AppString.SelectproductsName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.const20pxTextSize,
        ),
      ),
    );
  }
}
