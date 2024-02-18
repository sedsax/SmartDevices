import 'package:flutter/material.dart';

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
            children: const [
              Icon(
                Icons.person,
                size: 40,
                color: Colors.indigoAccent,
              ),
            ],
          ),
          Text(
            welcomeMessage,
            style:
                TextStyle(fontSize: 20, color: Colors.indigo[400]),
          ),
          const Text(
            userName,
            style: TextStyle(fontSize: 42, color: Colors.indigo),
          ),
          const SizedBox(height: 10),
          Text(
            smartDevices,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.grey.shade800,
            ),
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