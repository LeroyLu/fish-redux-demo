/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:30:26 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 17:36:01
 */

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.city: _initHomeState,
      HomeAction.init: _onInit,
      HomeAction.add: _onAdd,
    },
  );
}

HomeState _initHomeState(HomeState state, Action action) {
  if (action.payload == null) return state.clone();
  
  return state.clone()
    ..location = action.payload['city']
    ..count = 20
    ..start = 0
    ..total = 100;
}

HomeState _onInit(HomeState state, Action action) {
  if (action.payload == null) return state.clone();

  return state.clone()
    ..start = action.payload['size']
    ..total = action.payload['total']
    ..items.clear()
    ..items.addAll(action.payload['data']);
}

HomeState _onAdd(HomeState state, Action action) {
  if (action.payload == null) return state.clone();

  return state.clone()
    ..start += action.payload['size']
    ..total = action.payload['total']
    ..items.addAll(action.payload['data']);
}
