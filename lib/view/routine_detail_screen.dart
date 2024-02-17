import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/view-models/device_view_model.dart';

class DetailScreen extends StatelessWidget {
  final Device device;
  final int index;

  const DetailScreen({Key? key, required this.device, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: Consumer<DeviceViewModel>(builder: (context, deviceViewModel, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      device.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: DeviceCard(
                    device: device,
                    onChanged: (value) {
                      deviceViewModel.devicePowerSwitch(value, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
