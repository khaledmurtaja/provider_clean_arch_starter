import 'package:flutter/material.dart';
import '../constants/colors/app_colors.dart';


class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    this.isEnabled = true,
    required this.onPressed,
    this.fontSize,
    this.height,
    this.color,
    this.icon,
    this.outlined,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final bool isEnabled;
  final Icon? icon;
  final Color? color;
  final bool? outlined;

  final double? height;
  final double? fontSize;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 45,
      child: _buildButtonBody(),
    );
  }

  Widget _buildButtonBody() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 14),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          buttonColor(),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: borderColor(),
            ),
          ),
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: outlined == true ? AppColors.appMainColor : Colors.white,
                fontSize: fontSize ?? 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          (icon != null)
              ? Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 40, bottom: 10),
              child: icon,
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }

  Color buttonColor() {
    if (!isEnabled) {
      return Colors.grey;
    }
    if (outlined == true) {
      return Colors.white;
    } else if (color != null) {
      return color!;
    } else {
      return AppColors.appMainColor;
    }
  }

  Color borderColor() {
    if (outlined == true) {
      return AppColors.appMainColor;
    } else {
      return Colors.transparent;
    }
  }
}
