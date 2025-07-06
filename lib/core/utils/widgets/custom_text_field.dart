import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? svgIconPath;
  final bool obscureText;
  final String? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function()? suffixIconTap;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.svgIconPath,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.hintTextColor,
    this.textColor,
    this.borderColor,
    this.keyboardType,
    this.onChanged,
    this.suffixIconTap,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onSelection);
  }

  void onSelection() {
    if (focusNode.hasFocus) {
      widget.controller?.selection = TextSelection.fromPosition(
        TextPosition(
          offset: widget.controller!.text.length,
        ),
      );
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        if (widget.suffixIconTap == null) {
          FocusManager.instance.primaryFocus?.nextFocus();
        }
      },
      style: TextStyle(
        color: widget.textColor ?? AppColors.appMainColor,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColor ?? AppColors.appMainColor,
        ),
        prefixIcon: widget.svgIconPath != null
            ? SvgPicture.asset(
                widget.svgIconPath!,
                fit: BoxFit.scaleDown,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? InkWell(
                onTap: widget.suffixIconTap,
                child: SvgPicture.asset(
                  widget.suffixIcon!,
                  fit: BoxFit.scaleDown,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? AppColors.appGrey6c6c),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return 'هذا الحقل لا يمكن ان يكون فارغاً';
            }
            return null;
          }, // Assign the validator
    );
  }
}
