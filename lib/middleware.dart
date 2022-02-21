import 'dart:convert';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:weather_app_coppermobile/action.dart';
import 'package:weather_app_coppermobile/state.dart';
import 'package:geolocator/geolocator.dart';

ThunkAction<AppState> fetchWeather = (Store<AppState> store) async {
  //to get the current lat long
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  double weather;
  String location;
  // converting the latlong from double to string
  String lat = position.latitude.toString();
  String long = position.longitude.toString();
  String _api = "6f44faa22c78ff584ef45a1cc3354325"; //app if for the api
  try {
    Response response = await get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$_api'));
    Map data = jsonDecode(response.body);
    location = data['name'];

    //converting kelvin to celcius
    weather = data['main']['temp'] - 273.15;
  } catch (e) {
    print('caught error: $e');
    weather = 0;
    return;
  }
// dispatched a FetchWeatherAction to the store so we could update the new state.
  store.dispatch(FetchWeatherAction(location, weather));
};
