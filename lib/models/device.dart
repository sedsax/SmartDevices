import 'package:flutter/cupertino.dart';

class Device {
  final String name;
  final Icon icon;
  final bool isPowerOn;
  final List<String> features;

  Device({
    required this.name,
    required this.icon,
    required this.isPowerOn,
    required this.features,
  });
}
