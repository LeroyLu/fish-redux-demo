/*
 * @Author: leroylu 
 * @Date: 2019-04-22 13:30:51 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 16:23:28
 */

import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../movie_item_component/state.dart';
import '../movie_item_component/component.dart';

class MovieListAdapter extends DynamicFlowAdapter<HomeState> {
  MovieListAdapter()
      : super(
          pool: <String, Component<Object>>{'movie': MovieItemComponent()},
          connector: _MovieListConnector(),
        );
}

class _MovieListConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    var isNotEmpty = state.items?.isNotEmpty;
    if (isNotEmpty) {
      return state.items.map<ItemBean>((ListItemState data) => ItemBean('movie', data)).toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(HomeState state, List<ItemBean> movieList) {
    var isNotEmpty = movieList?.isNotEmpty;
    if (isNotEmpty) {
      state.items = List<ListItemState>.from(movieList.map<ListItemState>((ItemBean bean) => bean.data).toList());
    } else {
      state.items = <ListItemState>[];
    }
  }
}
