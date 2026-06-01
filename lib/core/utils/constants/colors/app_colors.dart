import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  AppColors._();
  static Color appMainColor = HexColor("#2D6677");
  static Color appDisabledMainColor = HexColor("#94b0b9");
  static Color appDisabledGrey = HexColor("#b3b3b3");
  static Color appWhite = HexColor('#FFFFFF');
  static Color appBlack = HexColor('#000000');
  static Color appBlack2525 = HexColor('#252525');
  static Color appGrey7070 = HexColor('#707070');
  static Color appGrey5c5c = HexColor('#5c5c5c');
  static Color appGrey6c6c = HexColor('#6C6C6C');
  static Color appGrey7d7d = HexColor('#7D7D7D');
  static Color appGreyDada = HexColor('#DADADA');
  static Color appGrey8e8e = HexColor('#e8e8e8');
  static Color appGrey4646 = HexColor('#464646');
  static Color appGrey7f7f = HexColor('#f7f7f7');
  static Color appGrey3e3e = HexColor('#e3e3e3');
  static Color appGrey9e9e = HexColor('#9e9e9e');
  static Color appGreyCf = HexColor('#CFCFCF');
  static Color appGreyWhite = HexColor('#dbd4d4');
  static Color appDarkGrey4545 = HexColor('#454545');
  static Color appPaleYellow = HexColor('#d3b257');
  static Color appYellow = HexColor('#ffde82');
  static Color appRed0020 = HexColor('#b00020');
  static Color appRed44336 = HexColor('#F44336');
  static Color appRed85151 = HexColor('#c85151');
  static Color appGreen = HexColor('#4CAF50');
  static Color appBlueGreen = HexColor('#607D8B');
  static Color appOrange = HexColor('#FF9800');
  static Color appCyan = HexColor('#21B7CA');
  static Color lightBlueBackground = HexColor("#E8F5FB");
  static Color appGreyTextField = HexColor('#F1F1F1');
  static Color appLightBlueColor = HexColor('#3B9CE3');
  static Color appScaffold = HexColor('#FBFBFB');

  // COLORS WITH OPACITY
  static Color appWhite70Opacity = HexColor('#FFFFFF').withOpacity(0.70);
  static Color appBlack10Opacity = HexColor('#000000').withOpacity(0.1);
  static Color appBlack12Opacity = HexColor('#000000').withOpacity(0.12);
  static Color appBlack87Opacity = HexColor('#000000').withOpacity(0.87);
  static Color appBlack45Opacity = HexColor('#000000').withOpacity(0.45);
  static Color appBlack54Opacity = HexColor('#000000').withOpacity(0.54);
  static Color appBlack38Opacity = HexColor('#000000').withOpacity(0.38);
  static Color appSemiBlack30Opacity = HexColor('#252525').withOpacity(0.30);
  static Color appGrey20Opacity = HexColor('#9e9e9e').withOpacity(0.20);
  static Color appGrey6c6c25Opacity = appGrey6c6c.withOpacity(0.25);
  static Color appGreyDa54Opacity = appGreyDada.withOpacity(0.54);

  // COLORS WITH SHADE
  static Color appGreyShade200 = HexColor('#EEEEEE');
  static Color appGreyShade300 = HexColor('#E0E0E0');
  static Color appGreyShade500 = HexColor('#9e9e9e');

  // TRANSPARENT COLOR
  static Color appTransparent = Colors.transparent;
}
