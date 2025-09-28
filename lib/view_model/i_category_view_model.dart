import 'package:flutter/foundation.dart';

abstract interface class ICategoryViewModel {
  String get title;
  String get iconName;
  ValueListenable<bool> get isChosen;
  void switchChosen();
}
