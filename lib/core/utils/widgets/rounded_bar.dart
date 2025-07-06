import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

class RoundedBar extends StatelessWidget {
  const RoundedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.appBlack12Opacity,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
