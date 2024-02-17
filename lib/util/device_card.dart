// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/models/device.dart';

// ignore: must_be_immutable
class DeviceCard extends StatelessWidget {
  final Device device;
  void Function(bool)? onChanged;

  DeviceCard({
    Key? key,
    required this.device,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.width / 1.9,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
            color: device.isPowerOn ? AppColors.deviceCardDark : AppColors.deviceCardLight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(device.icon, size: 60, color: device.isPowerOn ? Colors.white : Colors.black),
            Text(device.name, style: TextStyle(fontSize: 22, color: device.isPowerOn ? Colors.white : Colors.black),),
            Switch(value: device.isPowerOn, activeColor: Colors.green, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
