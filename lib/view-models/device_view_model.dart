import 'package:flutter/material.dart';
import 'package:smart_devices/models/device.dart';

class DeviceViewModel extends ChangeNotifier {
  List<Device> devices = [
    Device(name: 'Fan', isPowerOn: false, icon: Icons.wind_power),
    Device(name: 'Temperature', isPowerOn: false, icon: Icons.thermostat),
  ];

  void devicePowerSwitch(bool value, int index) {
    devices[index].isPowerOn = value;
    notifyListeners();
  }
}
