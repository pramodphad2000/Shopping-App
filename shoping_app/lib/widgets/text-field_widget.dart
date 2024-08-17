import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final Color? cursorColor;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final Color? hintColor;
  final String? initialValue;
  final BoxConstraints? constraints;
  final InputBorder? border;
  final double? cursorheight;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enabled;
  final bool obscureText;
  final int? maxLines;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? usertextColor;
  final Function(PointerDownEvent)? onOutSideTap;

  const TextFormFieldWidget({
    Key? key,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.controller,
    this.validator,
    this.width,
    this.obscureText = false,
    this.height,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.cursorColor,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.hintColor,
    this.initialValue,
    this.constraints,
    this.border,
    this.cursorheight,
    this.prefixIcon,
    this.autovalidateMode,
    this.focusNode,
    this.autofocus,
    this.onOutSideTap,
    this.backgroundColor,
    this.enabled,
    this.maxLines,
    this.contentPadding,
    this.usertextColor,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.inputFormatters,
        cursorColor: widget.cursorColor ?? Colors.black,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        autofocus: widget.autofocus ?? false,
        cursorHeight: widget.cursorheight,
        enabled: widget.enabled,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          border: widget.border ??
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: widget.border ??
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintStyle: widget.hintStyle,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          contentPadding: widget.contentPadding,
        ),
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.w600,
          color: widget.usertextColor ?? const Color(0xFF000000),
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: widget.onOutSideTap,
      ),
    );
  }
}
