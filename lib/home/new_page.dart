import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:increment_with_redux/home/app_state.dart';
import 'package:increment_with_redux/home/reducer.dart';
import 'package:redux/redux.dart';

class NewPage extends StatelessWidget {
   NewPage({Key? key}) : super(key: key);

   final store = Store(reducer, initialState: AppState.initialState());


   @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('new page'),
        ),
        body: Container(
          child: Center(
            child: Column(children: [
              StoreConnector<AppState, int>(
                converter: (store) => store.state.counter,
                builder: (_, counter) => Text(
                  '${counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),



              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('back to previous page'))
            ]),
          ),
        ),
      ),
    );
  }
}
