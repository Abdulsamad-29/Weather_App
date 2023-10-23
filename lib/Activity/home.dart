import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:dynamic_weather_icons/dynamic_weather_icons.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  // void timer(){
  //   Future.delayed(Duration(seconds: 3),(){
  //     print("Alarm is ringing");
  //   });
  //   print("You can do another stuff");
  // }
  // late String username;
  // Future<void> get_Data() async
  // {
  //   //process
  //   await Future.delayed(Duration(seconds: 2),(){
  //     username = "Samad";
  //   });
  //   //print("$username");
  // }
  //
  // void showData() async {
  //   await get_Data();
  //   print("$username");
  // }
  //
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String getcity = info?["city_value"];
    String icon = info?['icon_value'];
    String loc = info?['location'];
    String temp = info?["temp_value"].substring(0,2);
    String air = info?["air_speed_value"];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home activity"),
      // ),
      // body: Column(
      //   children: <Widget>[
      //     FloatingActionButton(
      //         onPressed: () => (),
      //     ),
      //     Text(info?["air_speed_value"]),
      //   ],
      // )
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: GradientAppBar(gradient: LinearGradient(
          colors: [Colors.blue.shade600,Colors.blue.shade300],begin: Alignment.topCenter,end: Alignment.bottomCenter),
      )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue.shade900, Colors.blue.shade300])),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ","")=="")
                          {
                            print("blank search");
                          }
                          else{
                            Navigator.pushNamed(context, '/loading',arguments: {
                              "searchText" : searchController.text,
                            });
                          }
                          //print(searchController.text);
                        },
                        child: Container(
                          child: Icon(Icons.search, color: Colors.blue),
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Any City Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        padding: EdgeInsets.all(5),
                        child: Row(children: <Widget>[
                          Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(width: 20,),
                          Column(
                            children: <Widget>[
                              Text(info?["des_value"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Text("In $getcity",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                            ],
                          )
                          //Text(info?["des_value"])
                        ],)
                        //Text("hello"),
                      ),
                    ),
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Icon(WeatherIcon.getIcon('wi-thermometer'),size: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("$temp",style: TextStyle(
                            fontSize: 80,
                            //fontWeight: FontWeight.bold,
                          ),),
                          Text("C",style: TextStyle(fontSize: 30),)
                        ],)
                      ],)
                    ),
                  ),
                ],
              ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.fromLTRB(24, 0, 14, 0),
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Icon(WeatherIcon.getIcon('wi-day-windy')),
                            ],),
                            SizedBox(height: 20,),
                            Text("$air",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            Text("Km/h",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                          ],
                        )
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30)),
                          margin: EdgeInsets.fromLTRB(14, 0, 24, 0),
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcon.getIcon('wi-humidity')),
                                ],),
                              SizedBox(height: 5,),
                              Text(info?["hum_value"],style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                              Text("Percent",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                            ],
                          )
                      ),
                    ),
                    ],),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Made By Abdul Samad",style: TextStyle(fontWeight: FontWeight.w500),),
                    Text("Data Provided By Openweathermap.org",style: TextStyle(fontWeight: FontWeight.w500),)
                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
