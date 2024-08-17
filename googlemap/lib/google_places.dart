import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class GooglePlaces extends StatefulWidget {
  const GooglePlaces({Key? key}) : super(key: key);
  @override
  State<GooglePlaces> createState() => _GooglePlacesState();
}

class _GooglePlacesState extends State<GooglePlaces> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionID = "12344";
  List<dynamic> _listPlaces = [];
  @override
  void initState() {
    // TODO: implement initState

    _controller.addListener(() {
      onchange();
    });
  }

  void onchange() {
    if (_sessionID == null) {
      _sessionID = uuid.v4();
    } else {
      getSuggestion(_controller.text);
    }
  }

  void getSuggestion(String input) async {
    String k_places_API = "AIzaSyD_0gwKG5wD_ZciOuR30g7Ob_WGiFF2QBE";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$k_places_API&sessiontoken=$_sessionID';
    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print(data);

    if (response.statusCode == 200) {
      setState(() {
        _listPlaces = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception("Failed to Load Data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Google Search Places"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SafeArea(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Search your Location"),
              controller: _controller,
            ),
          ],
        )),
      ),
    );
  }
}
