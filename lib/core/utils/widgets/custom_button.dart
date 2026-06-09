import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors/app_colors.dart';
import '../../../core/utils/constants/extensions/media_query_extension.dart';



/// A custom button widget.
///
/// This widget is used to create a button with customizable width,
/// a disabled state, text, and an `onPressed` callback.

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final bool isDisabled;
  final VoidCallback onPressed;
  /// Creates a custom button.
  ///
  /// [text] is the label displayed on the button.
  /// [onPressed] is the callback when the button is pressed.
  /// [isDisabled] determines whether the button is interactive.
  /// [width] is an optional parameter to set the button's width.

  const CustomButton({
    super.key,
    this.width,
    this.isDisabled = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? context.width, 48),
        backgroundColor: isDisabled
            ? AppColors.appDisabledMainColor
            : AppColors.appMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        isDisabled ? null : onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.spMin,
          color: AppColors.appWhite,
        ),
      ),
    );
  }
}
