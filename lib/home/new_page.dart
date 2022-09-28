import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:increment_with_redux/home/app_state.dart';


class NewPage extends StatelessWidget {
  NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new page'),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            StoreConnector<AppState, AppState>(
              // store: store,
              converter: ((store) => store.state),
              builder: (_, state) => Text(
                '${state.counter}',
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
    );
  }
}
