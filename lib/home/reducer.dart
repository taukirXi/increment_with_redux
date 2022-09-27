// ignore_for_file: unused_import

import 'package:increment_with_redux/home/app_state.dart';
import 'package:increment_with_redux/home/counter_action.dart';

//actions
enum Increment { increment }

//reducer pure function
AppState reducer(AppState prev, dynamic action) {
  if (action == Increment.increment) {
    return AppState(prev.counter + 1);
  } else {
    return prev;
  }
}
