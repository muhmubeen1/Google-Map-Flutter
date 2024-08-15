import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Currentlocation extends StatefulWidget {
  const Currentlocation({Key? key}) : super(key: key);
  @override
  State<Currentlocation> createState() => _CurrentlocationState();
}

class _CurrentlocationState extends State<Currentlocation> {
  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((onValue) {})
        .onError((error, stackTrace) {
      print(error);
    });
    return await Geolocator.getCurrentPosition();
  }

  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(37.0900, 67.909),
    zoom: 14,
  );
  List<Marker> _list = [];
  List<Marker> _markers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(56.910, 23.567),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _list.addAll(_markers);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: GoogleMap(
          initialCameraPosition: _cameraPosition,
          markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_disabled_outlined),
          onPressed: () {
            getUserLocation().then((value) async {
              print("Current Location");
              print(
                  value.latitude.toString() + "" + value.longitude.toString());
              _markers.add(Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude)));
              CameraPosition _cameraPosition = CameraPosition(
                target: LatLng(value.latitude, value.longitude),
                zoom: 14,
              );

              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(_cameraPosition));
              setState(() {});
            });
          },
        ),
      ),
    );
  }
}
