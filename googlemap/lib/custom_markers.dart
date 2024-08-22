import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkers extends StatefulWidget {
  const CustomMarkers({Key? key}) : super(key: key);

  @override
  State<CustomMarkers> createState() => _CustomMarkersState();
}

class _CustomMarkersState extends State<CustomMarkers> {
  final Completer<GoogleMapController> _controller = Completer();
  static const _initailCamera =
      CameraPosition(target: LatLng(35.682839, 139.759455), zoom: 14);
  List<String> images = ["image/car.png", "image/car1.png", "image/car2.png"];
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(35.658580, 139.745433),
      infoWindow: InfoWindow(title: "Japan Tower"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(35.710062, 139.810700),
      infoWindow: InfoWindow(title: "Tokyo Skytree"),
    ),
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(35.685175, 139.745433),
      infoWindow: InfoWindow(title: "Imperial Palace"),
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initailCamera,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_list),
          onMapCreated: _controller.complete,
        ),
      )),
    );
  }
}
