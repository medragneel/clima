
import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'package:intl/intl.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
    LocationScreen({this.locationWeather});
    final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen> {
    WeatherModel weather = WeatherModel();
    late int temperature;
    late double wind;
    late int humidity;
    late int visibility;
    late String cityName;
    late String weatherMessage;
    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        updateUI(widget.locationWeather);
      }

       void updateUI(dynamic weatherData) {
       setState(() {
       if (weatherData == null) {
        temperature = 0;
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        wind = 0.0;
        humidity=0;
        visibility = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['description'];
      weatherMessage = condition;
      cityName = weatherData['name'];
      wind = weatherData['wind']['speed'];
      humidity = weatherData['main']['humidity'];
      visibility = weatherData['visibility'];
                
     });

  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    return Scaffold(
    backgroundColor: mainColor,
    body: SafeArea(
    child: Center(
                    child: Column(
                        children: <Widget>[
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Align(
                                alignment: Alignment.topLeft,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black87,
                                        backgroundColor: mainColor,
                                        shadowColor: Colors.transparent,
                                        ),

                                    onPressed: () async{
                                    var weatherData = await weather.getLocationWeather();
                                    updateUI(weatherData);

                                    },               
                                child: Icon(Icons.my_location)
),
                                ),
                            Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: mainColor,
                                        shadowColor: Colors.transparent,
                                        foregroundColor: Colors.black87,
                                        ),

                                    onPressed: () async{
                                    var typedName = await Navigator.push(
                                            context, MaterialPageRoute(builder: (context){
                                                return CityScreen();
                                                }));
                                    if (typedName != null) {
                                    var weatherData = await weather.getCityWeather(typedName);
                                    updateUI(weatherData);
                                    }
                                    },               
child: Icon(Icons.search)
),
                                ),
                        ],),
                        SizedBox(height: 20.0,),
                        Text(cityName,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.0),),
                        SizedBox(height: 20.0,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal:20.0),
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                ),
                            child:Text(formattedDate,style: TextStyle(
                                    fontSize: 20.0,
                                    color: mainColor,
                                    ),),
                            ),
                        SizedBox(height: 20.0,),
                        Text(weatherMessage,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.0),),
                        SizedBox(height: 20.0,),
                        Text('$temperature°',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 100.0),),

                        Container(       
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        padding: EdgeInsets.symmetric(horizontal:25.0,vertical: 50.0),
                        decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),

              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[  
                Column(children: <Widget>[
                Icon(Icons.air,color: mainColor,size: 30.0,),
                SizedBox(height: 10.0,),
                Text('$wind km/h',style: TextStyle(color: mainColor,fontWeight: FontWeight.w800),),
                SizedBox(height: 5.0,),
                Text('Wind',style: TextStyle(color: mainColor),),
                ],),
                Column(children: <Widget>[
                Icon(Icons.water_drop,color: mainColor,size: 30.0,),
                SizedBox(height: 10.0,),
                Text('$humidity%',style: TextStyle(color: mainColor,fontWeight: FontWeight.w800),),
                SizedBox(height: 5.0,),
                Text('Humidity',style: TextStyle(color: mainColor),),
                ],),
                Column(children: <Widget>[
                Icon(Icons.remove_red_eye,color: mainColor,size: 30.0,),
                SizedBox(height: 10.0,),
                Text('$visibility m',style: TextStyle(color: mainColor,fontWeight: FontWeight.w800),),
                SizedBox(height: 5.0,),
                Text('Visibility',style: TextStyle(color: mainColor),),
                ],),
              ],)
),

            ]),
        
            )),
    );
  }
}
