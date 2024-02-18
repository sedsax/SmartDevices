// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/models/routine.dart';

// ignore: must_be_immutable
class DeviceCard extends StatelessWidget {
  //final Device device;
  final Routine routine;
  void Function(bool)? onChanged;

  DeviceCard({
    Key? key,
    required this.routine,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 3.9,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: routine.device.isPowerOn
              ? AppColors.deviceCardLight
              : AppColors.deviceCardDark,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(routine.device.icon,
                size: 60,
                color: routine.device.isPowerOn ? Colors.black : Colors.white),
            Text(
              routine.device.name,
              style: TextStyle(
                  fontSize: 22,
                  color: routine.device.isPowerOn ? Colors.black : Colors.white),
            ),
            Switch(
              value: routine.device.isPowerOn,
              activeColor: Colors.indigo,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[350],
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
