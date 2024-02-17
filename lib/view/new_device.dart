import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/view-models/device_view_model.dart';

class NewDevicePage extends StatefulWidget {
  const NewDevicePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewDevicePageState createState() => _NewDevicePageState();
}

class _NewDevicePageState extends State<NewDevicePage> {
  String routineName = '';
  Device? selectedDevice;

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
                children:[
                  IconButton( onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios),),
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
                    items: deviceViewModel.devices.map((device) {
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
                    onPressed: () {
                      Navigator.pop(context, {'name': routineName, 'device': selectedDevice});
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
