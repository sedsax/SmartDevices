import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/util/routine_card.dart';
import 'package:smart_devices/util/welcome_user.dart';
import 'package:smart_devices/view-models/device_view_model.dart';
import 'package:smart_devices/view/new_routine.dart';
import 'package:smart_devices/view/routine_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Consumer<DeviceViewModel>(
          builder: (context, deviceViewModel, _) {
            return Column(
              children: [
                const SizedBox(height: 10),
                const WelcomeUser(),
                const SizedBox(height: 10),
                 Expanded(
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
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: deviceViewModel.routines.length,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    itemBuilder: (context, index) {
                      final routine = deviceViewModel.routines[index];
                      return GestureDetector
                      (
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
