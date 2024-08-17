import 'package:flutter/material.dart';
// import 'package:geocoder2/geocoder2.dart';
// import 'package:yandex_geocoder/yandex_geocoder.dart';
import 'package:location_geocoder/location_geocoder.dart';

class LatToAddress extends StatefulWidget {
  const LatToAddress({Key? key}) : super(key: key);
  @override
  State<LatToAddress> createState() => _LatToAddressState();
}

class _LatToAddressState extends State<LatToAddress> {
  String stAddress = " ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Address Converter",
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(stAddress),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  try {
                    const _apiKey = 'AIzaSyD_0gwKG5wD_ZciOuR30g7Ob_WGiFF2QBE';
                    final LocatitonGeocoder geocoder =
                        LocatitonGeocoder(_apiKey);
                    final address = await geocoder.findAddressesFromCoordinates(
                        Coordinates(9.9312, 76.2673));
                    print(address.first.addressLine);
                  } catch (e) {
                    print("Error occurred: $e");
                  }

                  // try {
                  //   final query = "1600 Amphiteatre Parkway, Mountain View";
                  //   var addresses =
                  //       await Geocoder.local.findAddressesFromQuery(query);
                  //   var second = addresses.first;
                  //   print("${second.featureName} : ${second.coordinates}");
                  // } catch (e) {
                  //   print("Error occurred: $e");
                  // }
                },
                child: Container(
                  color: Colors.cyanAccent,
                  height: 60,
                  width: 160,
                  child: Center(
                    child: Text("Click and Convert"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
