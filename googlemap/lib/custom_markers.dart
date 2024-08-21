import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkers extends StatefulWidget {
  const CustomMarkers({Key? key}) : super(key: key);

  @override
  State<CustomMarkers> createState() => _CustomMarkersState();
}

class _CustomMarkersState extends State<CustomMarkers> {
  static const _initailCamera =
      CameraPosition(target: LatLng(35.682839, 139.759455), zoom: 14);
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
      position: LatLng(35.658580, 139.745433),
      infoWindow: InfoWindow(title: "Japan Tower"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initailCamera,
          mapType: MapType.normal,
        ),
      )),
    );
  }
}
