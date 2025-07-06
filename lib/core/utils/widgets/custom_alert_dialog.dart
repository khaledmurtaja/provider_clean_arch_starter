import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors/app_colors.dart';
import '../constants/images/app_images.dart';
import 'custom_button.dart';
import 'custom_outline_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final bool needAlertImage;
  final bool? isWarningAlert;
  final String? mainTitle;
  final String? subTitle;
  final String? outlineButtonText;
  final String? filledButtonText;
  final VoidCallback? outlineButtonPressed;
  final VoidCallback? filledButtonPressed;

  const CustomAlertDialog({
    super.key,
    required this.needAlertImage,
    this.isWarningAlert = true,
    this.mainTitle,
    this.subTitle,
    this.outlineButtonText,
    this.filledButtonText,
    this.outlineButtonPressed,
    this.filledButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 30,
          horizontal: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: needAlertImage,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 24),
                child: SvgPicture.asset(
                  isWarningAlert!
                      ? AppImages.warningAlert
                      : AppImages.successAlert,
                  width: 80.w,
                ),
              ),
            ),
            Visibility(
              visible: mainTitle != null,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 8),
                child: Text(
                  mainTitle ?? '',
                  style: TextStyle(
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appDarkGrey4545,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: subTitle != null,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 34),
                child: Text(
                  subTitle ?? '',
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appMainColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: outlineButtonText != null &&
                        outlineButtonPressed != null,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16),
                        child: CustomOutlineButton(
                          text: outlineButtonText ?? '',
                          onPressed: outlineButtonPressed ?? () {},
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible:
                        filledButtonText != null && filledButtonPressed != null,
                    child: Expanded(
                      child: CustomButton(
                        text: filledButtonText ?? '',
                        onPressed: filledButtonPressed ?? () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
