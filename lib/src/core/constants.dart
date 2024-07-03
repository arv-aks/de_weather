import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';

class Constants {
  static const String uvIndex = "UV INDEX";

  static const String wind = "WIND";

  static const String humidity = "HUMIDITY";
}

class WeatherConstants {
  static const String baseURL = "https://api.open-meteo.com/v1/forecast";
}

class PlacesConstants {
  static List<Places> placesList = [
    Places(name: 'Shimla', location: Location(lat: 31.1048, long: 77.1734)),
    Places(name: 'Mumbai', location: Location(lat: 19.0760, long: 72.8777)),
    Places(name: 'Bangalore', location: Location(lat: 12.9716, long: 77.5946)),
    Places(name: 'Kolkata', location: Location(lat: 22.5726, long: 88.3639)),
    Places(name: 'Chennai', location: Location(lat: 13.0827, long: 80.2707)),
    Places(name: 'Hyderabad', location: Location(lat: 17.3850, long: 78.4867)),
    Places(name: 'Pune', location: Location(lat: 18.5204, long: 73.8567)),
    Places(name: 'Ahmedabad', location: Location(lat: 23.0225, long: 72.5714)),
    Places(name: 'Jaipur', location: Location(lat: 26.9124, long: 75.7873)),
    Places(name: 'Lucknow', location: Location(lat: 26.8467, long: 80.9462)),
    Places(name: 'Delhi', location: Location(lat: 28.7041, long: 77.1025)),
    Places(name: 'Agra', location: Location(lat: 27.1767, long: 78.0081)),
    Places(name: 'Varanasi', location: Location(lat: 25.3176, long: 82.9739)),
    Places(name: 'Amritsar', location: Location(lat: 31.6340, long: 74.8723)),
    Places(name: 'Goa', location: Location(lat: 15.2993, long: 74.1240)),
    Places(name: 'Bhopal', location: Location(lat: 23.2599, long: 77.4126)),
    Places(name: 'Indore', location: Location(lat: 22.7196, long: 75.8577)),
    Places(name: 'Patna', location: Location(lat: 25.5941, long: 85.1376)),
    Places(name: 'Ranchi', location: Location(lat: 23.3441, long: 85.3096)),
    Places(name: 'Raipur', location: Location(lat: 21.2514, long: 81.6296)),
  ];
}
