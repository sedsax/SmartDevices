// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/models/device.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
          color: device.isPowerOn ? AppColors.deviceCardDark : AppColors.deviceCardLight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          device.icon,
          Text(device.name),
          Switch(value: device.isPowerOn, onChanged: onChanged),
        ],
      ),
    );
  }
}
