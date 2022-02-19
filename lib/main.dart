import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:weather_app_coppermobile/homepage.dart';
import 'package:weather_app_coppermobile/reducer.dart';
import 'package:weather_app_coppermobile/state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final store = Store<AppState>(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);

// root widget
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Weather App for Copper Mobile',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
