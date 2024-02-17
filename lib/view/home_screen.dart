import 'package:flutter/material.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/view/routine_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Device> devices = [
    Device(name: 'Fan', isPowerOn: false, icon: Icons.wind_power),
    Device(name: 'Temperature', isPowerOn: false, icon: Icons.thermostat),
  ];

  void devicePowerSwitch(bool value, int index) {
    setState(() {
      devices[index].isPowerOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: SafeArea(
          child: Column(
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
                    Icon(Icons.person,size: 40, ),
                  ],
                ),
                Text(
                  "Welcome Home,",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                ),
                const Text(
                  'Seda Savaş',
                  style: TextStyle(fontSize: 52),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              thickness: 1,
              color: Color.fromARGB(255, 204, 204, 204),
            ),
          ),
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
              itemCount: devices.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                final device = devices[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(device: device, onChanged: (value) => devicePowerSwitch(value, index),)),
                    );
                  },
                  child: DeviceCard(
                    device: device,
                    onChanged: (value) => devicePowerSwitch(value, index),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
