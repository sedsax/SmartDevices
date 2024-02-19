import 'package:flutter/material.dart';
import 'package:smart_devices/constants/colors.dart';
import 'package:smart_devices/view/new_routine_screen.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  static const String welcomeMessage = "Welcome Home,";
  static const String userName = 'Seda Savaş';
  static const String smartDevices = "Smart Devices";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.person,
                size: 40,
                color: AppColors.indigoA,
              ),
            ],
          ),
          Text(
            welcomeMessage,
            style: TextStyle(fontSize: 20, color: AppColors.indigo4),
          ),
          Text(
            userName,
            style: TextStyle(fontSize: 42, color: AppColors.indigo),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                smartDevices,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewRoutineScreen()),
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline, size: 40))
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
