import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/models/routine.dart';
import 'package:smart_devices/view-models/device_view_model.dart';

class NewRoutinePage extends StatefulWidget {
  const NewRoutinePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewRoutinePageState createState() => _NewRoutinePageState();
}

class _NewRoutinePageState extends State<NewRoutinePage> {
  String routineName = '';
  Device? selectedDevice;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<DeviceViewModel>(
            builder: (context, deviceViewModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Routine Name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        routineName = value;
                      });
                    },
                  ),
                  DropdownButtonFormField<Device>(
                    value: selectedDevice,
                    items: deviceViewModel.selectDevices.map((device) {
                      return DropdownMenuItem<Device>(
                        value: device,
                        child: Text(device.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDevice = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Select Device',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null && pickedTime != selectedTime) {
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          }
                        },
                        child: Text(
                          selectedTime == null
                              ? 'Select Time'
                              : 'Selected Time: ${selectedTime!.format(context)}',
                          style: TextStyle(
                            color: selectedTime == null ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent),
                    onPressed: () {
                      if (routineName.trim().isEmpty ||
                          selectedDevice == null || selectedTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please fill in the relevant fields!'),
                          ),
                        );
                      } else {
                        final newRoutine = Routine(
                          time: selectedTime!,
                          name: routineName,
                          device: selectedDevice!,
                          actions: [],
                        );
                        deviceViewModel.addRoutine(newRoutine);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add Routine'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
