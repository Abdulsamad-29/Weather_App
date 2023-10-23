import 'package:http/http.dart';
import 'dart:convert';
//lat=24.8607&lon=67.0011
class worker
{
  late String location;

  //Constructor
  worker({required this.location}){
   location = this.location;
  }
  late String  main,temperature,humidity,air_speed,description,icon,city;
  Future<void> getData() async {
    try{
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e');
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      //Getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getmain_desc = weather_main_data['main'];
      String getdesc = weather_main_data['description'];

      // Getting Temperature,airspeed,Humidity
      Map temp_data = data['main'];
      double gettemp = temp_data['temp']-273;
      String gethumidity = temp_data['humidity'].toString();


      //getting speed
      Map wind = data['wind'];
      double getair_speed = (wind['speed']*3600)/1000;

      String get_icon = weather_main_data['icon'];

      //Assigning values

      temperature = gettemp.toString();
      humidity = gethumidity;
      air_speed = getair_speed.toString();
      description = getdesc;
      main = getmain_desc; // weather main
      icon = get_icon;
      //city =

    }
    catch(e){
      temperature = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find data";
      main = "NA";
      icon = "03n";
    }

  }
}
