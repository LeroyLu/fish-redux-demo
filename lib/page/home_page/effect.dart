/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:33:47 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 17:23:47
 */

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'action.dart';
import 'package:douban_movie/page/home_page/movie_item_component/state.dart';
import 'package:douban_movie/util/service_util.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
    HomeAction.refresh: _init,
    HomeAction.more: _onMore,
  });
}

void _init(Action action, Context<HomeState> ctx) async {
  Response response = await Client.dio.get('/v2/movie/in_theaters', queryParameters: {
    'city': ctx.state.location,
    'start': 0,
    'count': ctx.state.count,
  });

  final content = response.data;

  int total = content['total'];
  List items = content['subjects'];

  List<ListItemState> list = [];
  items.forEach((item) {
    list.add(ListItemState(
      id: item['id'],
      name: item['title'],
      type: item['genres'].toString(),
      bgImage: item['images']['medium'],
    ));
  });

  ctx.dispatch(HomeActionCreater.onInitAction(total, list.length, list));
}

void _onMore(Action action, Context<HomeState> ctx) async {
  Response response = await Client.dio.get('/v2/movie/in_theaters', queryParameters: {
    'city': ctx.state.location,
    'start': ctx.state.start,
    'count': ctx.state.count,
  });

  final content = response.data;

  int total = content['total'];
  List items = content['subjects'];

  List<ListItemState> list = [];
  items.forEach((item) {
    list.add(ListItemState(
      id: item['id'],
      name: item['title'],
      type: item['genres'].toString(),
      bgImage: item['images']['medium'],
    ));
  });

  ctx.dispatch(HomeActionCreater.onAddAction(total, list.length, list));
}
