import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoping_app/const/app_sizes.dart';
import 'package:shoping_app/widgets/custom_circular_progress_indicator.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class OutlineButtonWidget extends StatefulWidget {
  final String? text;
  final IconData? iconData;
  final MaterialStateProperty<Color?>? labelColor;
  final double? labelFontSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool? inProgress;
  final bool? isBackArrow;
  final FontWeight? fontWeight;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? borderColor;
  final Color? textColor;
  const OutlineButtonWidget({
    super.key,
    this.onPressed,
    this.borderRadius = 0.0,
    this.labelColor,
    this.inProgress,
    this.text,
    this.labelFontSize,
    this.iconData,
    this.fontWeight,
    this.buttonWidth,
    this.buttonHeight,
    this.isBackArrow,
    this.borderColor,
    this.textColor,  StatelessWidget ,child,
  });

  @override
  State<OutlineButtonWidget> createState() => _OutlineButtonWidgetState();
}

class _OutlineButtonWidgetState extends State<OutlineButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: widget.borderColor ?? Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        backgroundColor: widget.labelColor ??
            MaterialStatePropertyAll(
              Theme.of(context).scaffoldBackgroundColor,
            ),
        minimumSize: MaterialStatePropertyAll(
          Size(
            widget.buttonWidth ?? AppSizes.setWidth(100),
            widget.buttonHeight ?? AppSizes.setHeight(45),
          ),
        ),
      ),
      child: (widget.inProgress ?? false)
          ? const CustomCircularProgressIndidator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.iconData != null) ...[
                  Icon(
                    widget.iconData,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5.w),
                ],
                if (widget.text != null)
                  TextWidget(
                    context: context,
                    data: widget.text!,
                    fontSize: widget.labelFontSize,
                    color: widget.textColor ?? Colors.black,
                    fontWeight: widget.fontWeight,
                  ),
              ],
            ),
    );
  }
}
