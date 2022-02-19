import 'package:weather_app_coppermobile/action.dart';
import 'package:weather_app_coppermobile/state.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchWeatherAction) {
    return AppState(action.location, action.weather);
  } else {
    return prev;
  }
}
