import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'package:go_router/go_router.dart';

import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/utils/routes/routes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomBottomNavigationBar({Key? key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int visit = -1;
  double height = 70;
  Color selectColor = const Color(0xff9DDEA5);
  Color color = const Color(0xff6B6B6B);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: BottomBarDefault(
        items: const [
          TabItem(
            icon: Icons.home,
            title: AppString.home,
          ),
          TabItem(
            icon: Icons.explore,
            title: AppString.explore,
          ),
          TabItem(
            icon: Icons.category_sharp,
            title: AppString.categories,
          ),
          TabItem(
            icon: Icons.person_outline,
            title: AppString.account,
          ),
          TabItem(
            icon: Icons.shopping_cart,
            title: AppString.cart,
          ),
        ],
        backgroundColor: AppColors.white,
        color: color,
        colorSelected: selectColor,
        indexSelected: visit,
        onTap: (int index) {
          switch (index) {
            case 0:
              context.push(Routes.homeScreen);
              FocusScope.of(context).unfocus();
              break;
            case 1:
              context.push(Routes.explore);
              FocusScope.of(context).unfocus();
              break;
            case 2:
              context.push(Routes.categories);

              FocusScope.of(context).unfocus();
              break;
            case 3:
              context.push(Routes.account);

              FocusScope.of(context).unfocus();
            case 4:
              context.push(Routes.mycart);

              FocusScope.of(context).unfocus();
              break;

            default:
              break;
          }
        },
      ),
    );
  }
}
