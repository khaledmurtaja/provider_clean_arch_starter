import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

// import 'package:nb_utils/nb_utils.dart';

// ignore: non_constant_identifier_names
Widget AuthTextField(
    // TextFieldType textFieldType,
        {
      var hintText,
      TextInputType? keyboardType,
      bool ? enabled = true,
      IconButton? suffixIcon,
      FormFieldValidator<String>? validator,
      TextEditingController? controller,
      bool? isPasswordObsecure,
      Icon? icon,
      TextInputAction? textInputAction,
      dynamic Function(String)? onFieldSubmitted,
      FocusNode? focus,
    }) {
  return TextFormField(
    controller: controller,
    enabled: enabled,
    keyboardType: keyboardType,
    obscureText: isPasswordObsecure ?? false,
    validator: validator,
    textInputAction: textInputAction,
    onFieldSubmitted: onFieldSubmitted,
    focusNode: focus,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 26),
      hintText: hintText,
      hintStyle:  TextStyle(
        color: AppColors.appDisabledGrey,
        fontSize: 16,
      ),

      filled: true,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      fillColor: const Color(0xFFf7f7f7),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Color(0xFFe3e3e3), width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        //      borderRadius: BorderRadius.circular(5),
        borderSide:
        BorderSide(color: AppColors.appMainColor.withOpacity(0.3), width: 0.0),
      ),
    ),
    cursorColor: Colors.black,
  );
}
