import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/util/routine_card.dart';
import 'package:smart_devices/view-models/device_view_model.dart';
import 'package:smart_devices/view/routine_detail_screen.dart';

class RoutineCardList extends StatelessWidget {
  const RoutineCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceViewModel>(builder: (context, deviceViewModel, _) {
      return Expanded(
        child: ListView.builder(
          itemCount: deviceViewModel.routines.length,
          padding: const EdgeInsets.symmetric(horizontal: 25),
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
              child: RoutineCard(
                  routine: routine,
                  index: index,
                  deviceViewModel: deviceViewModel),
            );
          },
        ),
      );
    });
  }
}
