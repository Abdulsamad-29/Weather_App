import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
import 'package:weather_app/Activity/loading.dart';
import 'package:weather_app/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    //home: Home(),
    routes: {
      "/" : (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading()
    },
    debugShowCheckedModeBanner: false,
  ));

}
