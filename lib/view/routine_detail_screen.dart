import 'package:flutter/material.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/util/device_card.dart';

class DetailScreen extends StatelessWidget {
  final Device device;

  const DetailScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
                  Text(device.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              
             
              Text(
                'Device Name: ${device.name}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Device Status: ${device.isPowerOn ? 'On' : 'Off'}',
                style: const TextStyle(fontSize: 20),
              ),
              DeviceCard(device: device, onChanged: null,),
            ],
          ),
        ),
      ),
    );
  }
}
