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

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final store = Store(reducer, initialState: AppState.initialState());
//
//     return StoreProvider(
//       store: store,
//       child: Scaffold(
//
//         appBar: AppBar(
//           title: Text('futter demo home page'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               // this way
//               StoreConnector<AppState, int>(
//                 converter: (store) => store.state._counter,
//                 builder: (_, counter) => Text(
//                   '${counter}',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ),
//               //other way
//               // StoreConnector<AppState, AppState>(
//               //   converter: (store) => store.state,
//               //   builder: (_, counter) => Text(
//               //     '${counter._counter}',
//               //     style: Theme.of(context).textTheme.headline4,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         floatingActionButton: StoreConnector<AppState,VoidCallback>(
//           converter: (store) =>() =>store.dispatch(Actions.Increment),
//           builder: (_, callback) => FloatingActionButton(
//             onPressed: callback,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ),
//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: (){
//         //     print("object")
//         //     store.reducer(store.state,Actions.Increment);
//         //   },
//         //   child: Icon(Icons.add),
//         // ),
//       ),
//     );
//   }
// }
