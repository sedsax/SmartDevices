import 'package:flutter/material.dart';
import 'package:smart_devices/models/device.dart';
import 'package:smart_devices/util/device_card.dart';

class DetailScreen extends StatefulWidget {
  final Device device;
  final Function(bool)? onChanged;

  const DetailScreen({super.key, required this.device, this.onChanged});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _isPowerOn;

  @override
  void initState() {
    super.initState();
    _isPowerOn = widget.device.isPowerOn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text(
                    widget.device.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: DeviceCard(
                    device: widget.device,
                    onChanged: (value) {
                      setState(() {
                        _isPowerOn = value;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
