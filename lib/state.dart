//The app state here has fields to display the location and weather. 
// I have also provided a getter method for each field to retrieve their respective values.

class AppState {
  final String _location;
  final double _weather;

  String get location => _location;
  double get weather => _weather;

  AppState(this._location, this._weather);

//The fields are initially set to empty values. 
  AppState.initialState()
      : _location = "",
        _weather = 0;
}
