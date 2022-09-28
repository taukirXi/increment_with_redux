import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:increment_with_redux/home/app_state.dart';
import 'package:increment_with_redux/home/home.dart';
import 'package:increment_with_redux/home/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}
// typedef VoidCallback = void Function();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final store = Store(reducer, initialState: AppState.initialState());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

