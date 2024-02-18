import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_devices/models/routine.dart';
import 'package:smart_devices/util/device_card.dart';
import 'package:smart_devices/util/routine_card.dart';
import 'package:smart_devices/view-models/device_view_model.dart';

class DetailScreen extends StatelessWidget {
  //final Device device;
  final Routine routine;
  final int index;

  const DetailScreen({Key? key, required this.routine, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: Consumer<DeviceViewModel>(builder: (context, deviceViewModel, _) {
        double heating = deviceViewModel.heating;
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.indigoAccent,),
                    ),
                    Text(
                      routine.device.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(Icons.more_vert, color: Colors.indigoAccent,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: DeviceCard(
                    routine: routine,
                    onChanged: (value) {
                      deviceViewModel.devicePowerSwitch(value, index);
                    },
                  ),
                ),
               (routine.device.name == "Thermostat") ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'HEATING',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Slider(
                              value: heating,
                              onChanged: (value) {
                                deviceViewModel.updateHeating(value);
                              },
                              activeColor: Colors.black,
                              max: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('0\u00B0'),
                                  Text('15\u00B0'),
                                  Text('30\u00B0'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                ) : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: RoutineCard(deviceViewModel: deviceViewModel, routine: routine, index: index,),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
