import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:increment_with_redux/home/app_state.dart';
import 'package:increment_with_redux/home/new_page.dart';
import 'package:increment_with_redux/home/reducer.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final store = Store(reducer, initialState: AppState.initialState());
    final store = Store(reducer, initialState: AppState(0));

    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('futter demo home page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // this way
              StoreConnector<AppState, int>(
                converter: (store) => store.state.counter,
                builder: (_, counter) => Text(
                  '${counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              //other way
              // StoreConnector<AppState, AppState>(
              //   converter: (store) => store.state,
              //   builder: (_, counter) => Text(
              //     '${counter._counter}',
              //     style: Theme.of(context).textTheme.headline4,
              //   ),
              // ),

              FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NewPage()),
                    );
                  },
                  child: Text('go to next page'))
            ],
          ),
        ),
        floatingActionButton: StoreConnector<AppState, VoidCallback>(
          converter: (store) => () => store.dispatch(Increment.increment),
          builder: (_, callback) => FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
