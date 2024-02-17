import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_devices/models/device.dart';

class DeviceViewModel extends ChangeNotifier {
  late SharedPreferences _prefs;

  List<Device> devices = [
    Device(name: 'Fan', isPowerOn: false, icon: Icons.wind_power),
    Device(name: 'Temperature', isPowerOn: false, icon: Icons.thermostat),
  ];

  DeviceViewModel(this._prefs) {
    loadDeviceData();
  }

  void loadDeviceData() async {
    _prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < devices.length; i++) {
      devices[i].isPowerOn = _prefs.getBool('device_$i') ?? false;
    }
    notifyListeners();
  }

  void _saveDeviceData() async {
    for (int i = 0; i < devices.length; i++) {
      await _prefs.setBool('device_$i', devices[i].isPowerOn);
    }
  }

  void devicePowerSwitch(bool value, int index) {
    devices[index].isPowerOn = value;
    _saveDeviceData();
    notifyListeners();
  }
}
