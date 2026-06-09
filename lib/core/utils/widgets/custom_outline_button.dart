import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/extensions/media_query_extension.dart';
import '../constants/colors/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final double? width;
  final bool isDisabled;
  final VoidCallback onPressed;

  const CustomOutlineButton({
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
        backgroundColor: AppColors.appWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color:
                isDisabled ? AppColors.appDisabledGrey : AppColors.appGrey6c6c,
          ),
        ),
      ),
      onPressed: () {
        isDisabled ? null : onPressed();
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.spMin,
          color: isDisabled ? AppColors.appDisabledGrey : AppColors.appGrey6c6c,
        ),
      ),
    );
  }
}
