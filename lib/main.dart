import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_devices/view-models/device_view_model.dart';
import 'package:smart_devices/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  final DeviceViewModel deviceViewModel = DeviceViewModel(_prefs);
  deviceViewModel.loadDeviceData();
  runApp(ChangeNotifierProvider(
    create: (context) => deviceViewModel,
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}


