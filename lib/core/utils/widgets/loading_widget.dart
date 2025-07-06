import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors/app_colors.dart';

class LoadingAnimationWidget extends StatelessWidget {
  const LoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SpinKitWaveSpinner(
          color: AppColors.appMainColor,
          waveColor: AppColors.appMainColor.withOpacity(0.2),
          trackColor: AppColors.appGreyShade300,
          size: 65,
        ),
      ),
    );
  }
}


class DotsLoadingAnimationWidget extends StatelessWidget {
  const DotsLoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SpinKitDoubleBounce(
          color: AppColors.appMainColor,
          size: 25,
        ),
      ),
    );
  }
}
