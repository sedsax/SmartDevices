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
    Device(name: 'Smart Bulb', isPowerOn: false, icon: Icons.light),
    Device(name: 'Power Plugs', isPowerOn: false, icon: Icons.power),
    Device(name: 'Curtains', isPowerOn: false, icon: Icons.blinds),
    Device(name: 'Smart Lock', isPowerOn: false, icon: Icons.lock),
  ];

  List<Routine> routines = [
    Routine(
      name: "Morning Routine",
      device: Device(name: "Smart Bulb", icon: Icons.light, isPowerOn: false),
      time: const TimeOfDay(hour: 7, minute: 30),
      actions: ["Turn on lights"],
    ),
    Routine(
      name: "Evening Routine",
      device: Device(name: "Smart Lock", icon: Icons.lock, isPowerOn: false),
      time: const TimeOfDay(hour: 20, minute: 0),
      actions: ["Lock doors", "Turn off lights"],
    ),
  ];
  // List<Routine> get routines => _routines;
  void addRoutine(Routine routine) {
    routines.add(routine);
    notifyListeners();
  }

  void deleteRoutine(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Routine"),
          content: const Text("Are you sure you want to delete this routine?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                routines.removeAt(index);
                notifyListeners();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  DeviceViewModel(this._prefs) {
    loadRoutineData();
  }

void loadRoutineData() async {
  _prefs = await SharedPreferences.getInstance();
  for (int i = 0; i < routines.length; i++) {
    routines[i].device.isPowerOn = _prefs.getBool('routine_device_$i') ?? false;
  }
  notifyListeners();
}

void _saveRoutineData() async {
  for (int i = 0; i < routines.length; i++) {
    await _prefs.setBool('routine_device_$i', routines[i].device.isPowerOn);
  }
}


  void devicePowerSwitch(bool value, int index) {
    final device = routines[index].device;
    device.isPowerOn = value;
    _saveRoutineData();
    notifyListeners();
  }

  void updateHeating(double value) {
    _heating = value;
    notifyListeners();
  }
}
