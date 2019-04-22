/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:05:39 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 15:35:36
 */

import 'package:fish_redux/fish_redux.dart';

import 'package:douban_movie/page/home_page/movie_item_component/state.dart';

class HomeState implements Cloneable<HomeState> {
  String location;
  int count;
  int start;
  int total;
  List<ListItemState> items;

  @override
  HomeState clone() {
    return HomeState()
      ..location = location
      ..count = count
      ..start = start
      ..items = items;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState()
    ..location = '北京'
    ..count = 20
    ..start = 0
    ..total = 100
    ..items = <ListItemState>[];
}
