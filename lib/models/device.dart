import 'package:flutter/cupertino.dart';

class Device {
  final String name;
  final IconData icon;
  bool isPowerOn;

  Device({
    required this.name,
    required this.icon,
    required this.isPowerOn,
  });
}
