import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/view-models/device_view_model.dart';
import 'package:smart_devices/view/routine_detail_screen.dart';

class DeviceCardList extends StatelessWidget {
  const DeviceCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceViewModel>(builder: (context, deviceViewModel, _) {
      return Expanded(
        child: ListView.builder(
          itemCount: deviceViewModel.routines.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          itemBuilder: (context, index) {
            final routine = deviceViewModel.routines[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      routine: routine,
                      index: index,
                    ),
                  ),
                );
              },
              child: DeviceCard(
                routine: routine,
                onChanged: (value) =>
                    deviceViewModel.devicePowerSwitch(value, index),
              ),
            );
          },
        ),
      );
    });
  }
}
