import 'package:clima/screens/location_screen.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';
import '../services/network.dart';

import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

late http.Response res;
String apiKey = '';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void getLoc() async {
    Location loc = Location();
    await loc.getLoc();
    var lat = loc.lat;
    var long = loc.long;
    var res = await Networking('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric').getData();
    // http.Response res = await  http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$api_key&units=metric'));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: res,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: mainColor,
      body: Center(
        child: SpinKitWave(
          color: Colors.black87,
          size: 50.0,
        ),
      ),
    );
  }
}

