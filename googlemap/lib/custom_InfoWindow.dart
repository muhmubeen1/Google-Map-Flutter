import 'package:flutter/material.dart';

class CustomInfoWindow extends StatefulWidget {
  const CustomInfoWindow({Key? key}) : super(key: key);
  @override
  State<CustomInfoWindow> createState() => _CustomInfoWindowState();
}

class _CustomInfoWindowState extends State<CustomInfoWindow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom Info Window"),
        ),
        body: SafeArea(
            child: Column(
          children: [Text("Custom Window info")],
        )),
      ),
    );
  }
}
