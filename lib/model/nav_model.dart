import 'package:flutter/cupertino.dart';

class NavModel {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  Widget widget;

  NavModel({
    required this.title,
    required this.icon,
    required this.activeIcon,
    required this.widget,
  });
}