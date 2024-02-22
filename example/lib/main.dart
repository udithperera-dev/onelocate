import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:onelocate/onelocate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _platformLocation = 'Unknown';
  String _platformLat = 'Unknown';
  String _platformLon = 'Unknown';
  final _onelocatePlugin = Onelocate();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await _onelocatePlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      await _onelocatePlugin.getLocation().then((value){
        _platformLocation = value!['city'].toString() ?? 'Unknown location';
        _platformLocation = _platformLocation+", "+ value!['country'].toString() ?? 'Unknown location';
        _platformLat = value!['lat'].toString() ?? 'Unknown location';
        _platformLon = value!['lon'].toString() ?? 'Unknown location';
      });
    } on PlatformException {
      platformVersion = 'Failed to get location.';
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Locate',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('One Locate'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/marker.png"),
              SizedBox(height: 20,),
              Text('Running on: $_platformVersion\n'),
              SizedBox(height: 20,),
              Text('Locate on: $_platformLocation\n'),
              SizedBox(height: 20,),
              Text('Lat: $_platformLat\n'),
              SizedBox(height: 20,),
              Text('Lon: $_platformLon\n'),
            ],
          ),
        ),
      ),
    );
  }
}
