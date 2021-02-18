import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

const Map<TabItem, String> tabName = {
  TabItem.red: 'Red',
  TabItem.green: 'Green',
  TabItem.blue: 'Blue',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};