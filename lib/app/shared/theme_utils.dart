import 'package:flutter/material.dart';

class ThemeUtils {
  static Color primaryColor;
  static Color primatyColorDark;
  static Color primaryColorLight;
  static Color accentColor;
  static ThemeData theme;

  static void init(BuildContext context){
    theme = Theme.of(context);
    primaryColor = theme.primaryColor;
    primatyColorDark = theme.primaryColorDark;
    accentColor = theme.accentColor;
  }

}
