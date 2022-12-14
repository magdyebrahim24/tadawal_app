
import 'package:flutter/cupertino.dart';

extension MediaQueryValues on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get topInsets => MediaQuery.of(this).viewInsets.top;
}