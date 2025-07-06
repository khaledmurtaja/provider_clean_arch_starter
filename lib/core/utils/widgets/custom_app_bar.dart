import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/constants/colors/app_colors.dart';
import '../constants/images/app_images.dart';

PreferredSizeWidget customAppBar(
    {PreferredSizeWidget? bottom,
    bool needRefreshButton = false,
    bool needUserInfo = true,
    bool needLogoutBtn = false,
    required BuildContext context,
    Function? onRefreshPressed,
    required String title,
    String? userName,
    bool showExitConfirmationLogic = false}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.appScaffold,
    surfaceTintColor: Colors.transparent,
    leadingWidth: 31.w,
    toolbarHeight: 50.h,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 17.spMin,
        fontWeight: FontWeight.w400,
        color: AppColors.appDarkGrey4545,
      ),
    ),
    leading: InkWell(
      onTap: () async {
        if (showExitConfirmationLogic) {
          bool exitApp = await showExitConfirmationDialog(context);
          if (exitApp) {
            Navigator.pop(context);
          }
        } else {
          Navigator.pop(context);
        }
      },
      child: SvgPicture.asset(AppImages.backArrow),
    ),
    actions: [
      InkWell(
        onTap: () {
          if (onRefreshPressed != null) {
            onRefreshPressed();
          }
        },
        child: Visibility(
          visible: needRefreshButton,
          child: SvgPicture.asset(
            AppImages.refresh,
            width: 44,
          ),
        ),
      ),
      Visibility(
        visible: needUserInfo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColors.appMainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                userName ?? "",
                style: TextStyle(
                  color: AppColors.appWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: needLogoutBtn,
        child: InkWell(
          onTap: () {
            showExitConfirmationDialog(context,
                content: "هل انت متأكد من انك تريد تسجيل الخروج",
                headline: "تسجيل الخروج", whenYes: () {
              ///TODO IMPLEMENT SIGN OUT LOGIC

            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AppImages.logout,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ),
    ],
    bottom: bottom,
  );
}

Future<bool> showExitConfirmationDialog(BuildContext context,
    {String headline = "مغادرة التطبيق",
    String content = "هل انت متاكد من انك تريد مغادرة التطبيق",
    Function? whenYes}) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(headline),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Cancel
              child: const Text("لا"),
            ),
            TextButton(
              onPressed: () {
                if (whenYes != null) {
                  whenYes();
                } else {
                  SystemNavigator.pop();
                }
              }, // Confirm
              child: const Text("نعم"),
            ),
          ],
        ),
      ) ??
      false;
}
