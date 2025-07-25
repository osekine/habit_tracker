import 'package:flutter/foundation.dart';

abstract interface class ICategoryViewModel {
  String get title;
  // TODO(NLU): add icon
  ValueListenable<bool> get isChosen;
}
