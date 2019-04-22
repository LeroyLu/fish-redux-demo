/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:24:46 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 17:10:49
 */

import 'package:fish_redux/fish_redux.dart';

import 'package:douban_movie/page/home_page/movie_item_component/state.dart';

enum HomeAction { init, refresh, more, add, city }

class HomeActionCreater {
  static Action onInitAction(int total, int size, List<ListItemState> data) {
    return Action(HomeAction.init, payload: {
      'total': total,
      'size': size,
      'data': data,
    });
  }

  static Action onAddAction(int total, int size, List<ListItemState> data) {
    return Action(HomeAction.add, payload: {
      'total': total,
      'size': size,
      'data': data,
    });
  }

  static Action onRefreshAction() {
    return Action(HomeAction.refresh, payload: null);
  }

  static Action onMoreAction() {
    return Action(HomeAction.more, payload: null);
  }

  static Action onCityAction(String city) {
    return Action(HomeAction.city, payload: {'city': city});
  }
}
