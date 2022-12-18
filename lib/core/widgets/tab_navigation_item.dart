import 'package:flutter/material.dart';

class TabNavigationItem {
  final Widget page;
  final Image image;
  final Image activeImage;
  final String pageAppBarTitle;

  TabNavigationItem({
    required this.page,
    required this.image,
    required this.activeImage,
    required this.pageAppBarTitle,
  });
}