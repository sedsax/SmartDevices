import 'package:flutter/material.dart';
import 'package:smart_devices/models/device.dart';

class Routine {
  final String name;
  final Device device;
  final TimeOfDay time;
  final List<String> actions;

  Routine({
    required this.name,
    required this.device,
    required this.time,
    required this.actions,
  });
}
