import 'package:geolocator/geolocator.dart';

class Location {
    late double lat;
    late double long;

    Future<void> getLoc() async{
    try {
        Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        lat = pos.latitude;
        long = pos.longitude;
          
        } catch (e) {
        print(e);
          
        }
    }
  
}

