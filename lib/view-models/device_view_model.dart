import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/models/routine.dart';

class DeviceViewModel extends ChangeNotifier {
  late SharedPreferences _prefs;
  double _heating = 0; 
  double get heating => _heating; 

  List<Device> devices = [
    Device(name: 'Fan', isPowerOn: false, icon: Icons.wind_power),
    Device(name: 'Thermostat', isPowerOn: false, icon: Icons.thermostat),
   // Device(name: 'Smart TV', isPowerOn: false, icon: Icons.tv),
  ];

  List<Device> selectDevices = [
    Device(name: 'Fan', isPowerOn: false, icon: Icons.wind_power),
    Device(name: 'Thermostat', isPowerOn: false, icon: Icons.thermostat),
    Device(name: 'Smart TV', isPowerOn: false, icon: Icons.tv),
    Device(name: 'Camera', isPowerOn: false, icon: Icons.camera_indoor),
    Device(name: 'Bulbs', isPowerOn: false, icon: Icons.light),
    Device(name: 'Power Plugs', isPowerOn: false, icon: Icons.power),
    Device(name: 'Curtains', isPowerOn: false, icon: Icons.blinds),
  ];
  

  // veriler kaydedilecek
  //listeyi güncelleme ve silme seçenekleri de eklenecek
  final List<Routine> _routines = [];
  List<Routine> get routines => _routines;
  void addRoutine(Routine routine) {
    _routines.add(routine);
    notifyListeners(); 
  }

  void deleteRoutine(int index) {
  _routines.removeAt(index);
  notifyListeners();
}


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

  void updateHeating(double value) {
    _heating = value;
    notifyListeners(); 
  }
}
