import 'dart:convert';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:weather_app_coppermobile/action.dart';
import 'package:weather_app_coppermobile/state.dart';
import 'package:geolocator/geolocator.dart';

ThunkAction<AppState> fetchWeather = (Store<AppState> store) async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  try {
    Response response =
        await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?'));
    print(response);
  } catch (e) {
    print('caught error: $e');
    return;
  }

  double weather;
  String location;
  String lat = position.latitude.toString();
  String long = position.longitude.toString();
  String _api = "6f44faa22c78ff584ef45a1cc3354325";
  try {
    Response response = await get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$_api'));
    Map data = jsonDecode(response.body);
    location = data['name'];
    weather = data['main']['temp'] - 273.15;
  } catch (e) {
    print('caught error: $e');
    weather = 0;
    return;
  }

  store.dispatch(FetchWeatherAction(location, weather));
};
