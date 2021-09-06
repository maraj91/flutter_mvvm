import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/res/colors/BaseColors.dart';

class AppColors implements BaseColors{
  Map<int, Color> _primary =
  {
    50:Color.fromRGBO(22, 134, 206, 0.1),
    100:Color.fromRGBO(22, 134, 206, 0.2),
    200:Color.fromRGBO(22, 134, 206, 0.3),
    300:Color.fromRGBO(22, 134, 206, 0.4),
    400:Color.fromRGBO(22, 134, 206, 0.5),
    500:Color.fromRGBO(22, 134, 206, 0.6),
    600:Color.fromRGBO(22, 134, 206, 0.7),
    700:Color.fromRGBO(22, 134, 206, 0.8),
    800:Color.fromRGBO(22, 134, 206, 0.9),
    900:Color.fromRGBO(22, 134, 206, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xff1686ce,_primary);

  @override
  Color get colorPrimaryText => Color(0xff49ABFF);

  @override
  Color get colorSecondaryText => Color(0xff3593FF);

  @override
  Color get colorWhite => Color(0xffffffff);

  @override
  Color get colorBlack => Color(0xff000000);

  @override
  Color get castChipColor => Colors.deepOrangeAccent;

  @override
  Color get catChipColor => Colors.indigoAccent;
}