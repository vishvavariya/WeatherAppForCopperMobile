import 'package:weather_app_coppermobile/action.dart';
import 'package:weather_app_coppermobile/state.dart';

// The reducer function receives the state and the action.

AppState reducer(AppState prev, dynamic action) {
  //If the action is a FetchWeather, it returns a new state using the values in the action fields.

  if (action is FetchWeatherAction) {
    return AppState(action.location, action.weather);
  }
  //Otherwise, it returns to the previous state.
  else {
    return prev;
  }
}
