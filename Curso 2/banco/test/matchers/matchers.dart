import 'package:banco/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool fetureItemMatcher(Widget widget, String nome, IconData icon) {
  if (widget is FeatureItem) {
    return widget.nome == nome && widget.icon == icon;
  }
  return false;
}


bool textFieldMatcher(Widget widget, String labelText) {
  if (widget is TextField) {
    return widget.decoration.labelText == labelText;
  }
  return false;
}