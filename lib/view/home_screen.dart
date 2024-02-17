import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/view-models/device_view_model.dart';
import 'package:smart_devices/view/routine_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: SafeArea(
        child: Consumer<DeviceViewModel>(
          builder: (context, deviceViewModel, _) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Padding(
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
                          ),
                        ],
                      ),
                      Text(
                        "Welcome Home,",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade800),
                      ),
                      const Text(
                        'Seda Savaş',
                        style: TextStyle(fontSize: 52),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Smart Devices",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    itemCount: deviceViewModel.devices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final device = deviceViewModel.devices[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                device: device,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: DeviceCard(
                          device: device,
                          onChanged: (value) =>
                              deviceViewModel.devicePowerSwitch(value, index),
                        ),
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
