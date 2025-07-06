import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

class AppDividerWidget extends StatelessWidget {
  final Color? color;
  const AppDividerWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: color ?? AppColors.appGreyShade200,
    );
  }
}
