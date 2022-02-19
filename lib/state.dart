class AppState {
  final String _location;
  final double _weather;

  String get location => _location;
  double get weather => _weather;

  AppState(this._location, this._weather);

  AppState.initialState()
      : _location = "",
        _weather = 0;
}
