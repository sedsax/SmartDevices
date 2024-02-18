import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/util/device_card_list.dart';
import 'package:smart_devices/util/routine_card_list.dart';
import 'package:smart_devices/util/welcome_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 10),
            WelcomeUser(),
            SizedBox(height: 10),
            DeviceCardList(),
            RoutineCardList(),
          ],
        ),
      ),
    );
  }
}
