import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:weather_app_coppermobile/middleware.dart';
import 'package:weather_app_coppermobile/state.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App for Copper Mobile"),
      ),

      //display weather and the location
      body: Center(
        child: Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  return Text(
                    'Current weather in ${state.location} is ${state.weather.toInt()}°C',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold),
                  );
                },
              ),
//button to press to get the current location
              StoreConnector<AppState, FetchWeather>(
                converter: (store) => () => store.dispatch(fetchWeather),
                builder: (_, fetchWeatherCallback) {
                  return SizedBox(
                    width: 300,
                    height: 50,
                    child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.brown,
                        onPressed: fetchWeatherCallback,
                        child: const Text(
                          "Click to Fetch Weather",
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
typedef FetchWeather = void Function();
