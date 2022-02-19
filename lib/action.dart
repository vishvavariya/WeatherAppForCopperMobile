class FetchWeatherAction {
  final String _location;
  final double _weather;

  String get location => _location;
  double get weather => _weather;

  FetchWeatherAction(this._location, this._weather);
}
