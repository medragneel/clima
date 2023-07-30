import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
    late String cityName;
    @override
        Widget build(BuildContext context) {
            return Scaffold(
                    backgroundColor: mainColor,
                    body: Column(
                        children: <Widget>[
                        Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    backgroundColor: mainColor,
                                    shadowColor: Colors.transparent,
                                    ),

                        onPressed: (){
                        Navigator.pop(context);
                        },               
                        child: Icon(Icons.arrow_back)
                        ),
                        ),
                        SizedBox(height: 30.0,),
                        Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: 
                        TextField(
                        onChanged: (value){
                        cityName = value; 
                        },
                            decoration: InputDecoration(
                            filled: true,
                                hintText: 'Enter City NamEnter City Namee' ,
                                icon: Icon(Icons.location_city),
                                fillColor: Colors.white70 ,                      ),
                            ),
                        ),
                        SizedBox(height: 30.0,),
                        TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.black87),
                        onPressed: (){
                        Navigator.pop(context,cityName);

                        },
                        child: Text('Get Weather'),
                        ),


    ],)
    );

  }
}
