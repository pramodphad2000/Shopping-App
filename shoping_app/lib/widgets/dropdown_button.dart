
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/widgets/text_widget.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatefulWidget {
  final List<String>? items;
  String? selectedValue;
  final ValueChanged<String>? onChanged;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  CustomDropdownButton({
    this.items,
    this.selectedValue,
    this.onChanged,
    this.color,
    this.fontWeight,
    this.fontSize,
  });

  @override
  CustomDropdownButtonState createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectedValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 28.sp,
        style: GoogleFonts.kumbhSans(
            color: AppColors.black,
            fontSize: 32.sp,
            fontWeight: FontWeight.w900),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedValue = newValue;
            widget.onChanged?.call(newValue ?? '');
          });
        },
        items: widget.items?.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: TextWidget(
              context: context,
              data: value,
            ),
          );
        }).toList(),
      ),
    );
  }
}
