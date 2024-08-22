import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarkers extends StatefulWidget {
  const CustomMarkers({Key? key}) : super(key: key);

  @override
  State<CustomMarkers> createState() => _CustomMarkersState();
}

class _CustomMarkersState extends State<CustomMarkers> {
  Uint8List? _markerimage;
  final List<Marker> _markers = [];
  final List<LatLng> _cordinates = const [
    LatLng(35.685175, 139.745433),
    LatLng(35.710062, 139.810700),
    LatLng(35.658580, 139.745433),
  ];
  final Completer<GoogleMapController> _controller = Completer();
  static const _initailCamera =
      CameraPosition(target: LatLng(35.682839, 139.759455), zoom: 14);
  List<String> _images = ["image/car.png", "image/car1.png", "image/car2.png"];
  Future<Uint8List> getImagesBytes(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // List<Marker> _list = const [
  //   Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(35.658580, 139.745433),
  //     infoWindow: InfoWindow(title: "Japan Tower"),
  //   ),
  //   Marker(
  //     markerId: MarkerId("2"),
  //     position: LatLng(35.710062, 139.810700),
  //     infoWindow: InfoWindow(title: "Tokyo Skytree"),
  //   ),
  //   Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(35.685175, 139.745433),
  //     infoWindow: InfoWindow(title: "Imperial Palace"),
  //   )
  // ];
  @override
  void initState() {
    // TODO: implement initState
    loadData();
  }

  loadData() async {
    for (int i = 0; i < _images.length; i++) {
      final Uint8List _markerImage = await getImagesBytes(_images[i], 50);
      _markers.add(Marker(
        icon: BitmapDescriptor.bytes(
          _markerImage,
        ),
        markerId: MarkerId(i.toString()),
        position: _cordinates[i],
        infoWindow: InfoWindow(title: "This is Marker ${i}"),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initailCamera,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_markers),
          onMapCreated: _controller.complete,
        ),
      )),
    );
  }
}
