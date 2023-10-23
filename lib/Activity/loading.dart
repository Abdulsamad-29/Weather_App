import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // late String Temperature="Loading";
  late String temp,hum,air_speed,des,main,icon,loc,city="Lahore";
  void startApp(String city) async
  {
    //city = city;
    worker w1 = worker(location: city);
    await w1.getData();
    temp=w1.temperature;
    hum=w1.humidity;
    air_speed=w1.air_speed;
    des=w1.description;
    main=w1.main;
    icon=w1.icon;
    loc=w1.location;
    
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value":air_speed,
        "des_value":des,
        "main_value":main,
        "icon_value":icon,
        "location":loc,
        "city_value":city,
      }
      );
    });
    // setState(() {
    //   Temperature = w1.temperature;
    // });
    // print(w1.location);
    // print(w1.air_speed);
    // print(w1.description);

  }
  @override
  void initState() {
    // TODO: implement initState
    //print(w1.air_speed);
    //print("Hello");
    super.initState();
  }
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty?? false)
      {
        city =search?['searchText'];
      }
    startApp(city);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset("images/logo.jpg",height: 220,width: 240,),
            Text("Weather App",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),),
            SizedBox(height: 10,),
              Text("Made by Abdul Samad",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                  color: Colors.white
              ),),
            SizedBox(height: 20,),
            SpinKitWave(
            color: Colors.white,
            size: 50.0,
          )
          ],),
        ),
      ),
      backgroundColor: Colors.blue[400],
    );
  }
}

