import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4220, -122.0841), // Coordinates for the Googleplex
    zoom: 14,
  );
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(37.4220, -122.0841),
      infoWindow: InfoWindow(title: "Current Location"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(37.56, -122.0753),
      infoWindow: InfoWindow(title: "Second Location"),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState

    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          compassEnabled: true,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )),
      ),
    );
  }
}
