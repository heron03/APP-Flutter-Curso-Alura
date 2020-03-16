import 'package:banco/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';

bool fetureItemMatcher(Widget widget, String nome, IconData icon) {
  if (widget is FeatureItem) {
    return widget.nome == nome && widget.icon == icon;
  }
  return false;
}
