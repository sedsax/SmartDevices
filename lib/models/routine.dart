import 'package:smart_devices/models/device.dart';

class Routine {
  final String name;
  final List<Device> devices;
  final List<String> actions;

  Routine({
    required this.name,
    required this.devices,
    required this.actions,
  });
}
