import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/constants/routine_textstyle.dart';
import 'package:smart_devices/models/routine.dart';
import 'package:smart_devices/view-models/device_view_model.dart';

class RoutineCard extends StatelessWidget {
  final Routine routine;
  final int index;
  final DeviceViewModel deviceViewModel;

  const RoutineCard({
    Key? key,
    required this.routine,
    required this.index,
    required this.deviceViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.routineCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Row(
              children: [
                Text(
                  routine.name,
                  style: AppStyles.routineTextStyle,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.routinePink,
                  ),
                  padding: const EdgeInsets.all(9.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      routine.time.format(context),
                      style: AppStyles.timeTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: routine.actions.map((action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    action,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
              children: [
                Text(
                  routine.device.name,
                  style: AppStyles.routineTextStyle,
                ),
                Icon(
                  routine.device.icon,
                  color: AppColors.routinePink,
                  size: 40,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    deviceViewModel.deleteRoutine(context, index);
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                  color: AppColors.routinePink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
