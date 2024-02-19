import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/models/routine.dart';
import 'package:smart_devices/view-models/device_view_model.dart';


void main() {
  group('DeviceViewModel Tests', () {
    test('A new routine should be added', () async {
      WidgetsFlutterBinding.ensureInitialized();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var viewModel = DeviceViewModel(prefs);

      var routine = Routine(
        name: "Evening Routine",
        device: Device(name: "Smart Lock", icon: Icons.lock, isPowerOn: false),
        time: const TimeOfDay(hour: 20, minute: 0),
        actions: ["Lock doors", "Turn off lights"],
      );

      viewModel.addRoutine(routine);

      expect(viewModel.routines.contains(routine), true);
    });
  });
}
