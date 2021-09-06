
import 'package:flutter/cupertino.dart';
import 'package:project/res/Resources.dart';
import 'package:project/res/dimentions/AppDimension.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}