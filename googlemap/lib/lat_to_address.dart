import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class LatToAddress extends StatefulWidget {
  const LatToAddress({Key? key}) : super(key: key);
  @override
  State<LatToAddress> createState() => _LatToAddressState();
}

class _LatToAddressState extends State<LatToAddress> {
  String stAddress = "";
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
                    final coordinates = Coordinates(56.910, 23.567);
                    var addresses = await Geocoder.local
                        .findAddressesFromCoordinates(coordinates);
                    var first = addresses.first;
                    print(
                        "Address: ${first.featureName} : ${first.addressLine}");
                    setState(() {
                      stAddress = first.addressLine.toString();
                    });
                  } catch (e) {
                    print("Error occurred: $e");
                  }
                  try {
                    final query = "1600 Amphiteatre Parkway, Mountain View";
                    var addresses =
                        await Geocoder.local.findAddressesFromQuery(query);
                    var second = addresses.first;
                    print("${second.featureName} : ${second.coordinates}");
                  } catch (e) {
                    print("Error occurred: $e");
                  }
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
