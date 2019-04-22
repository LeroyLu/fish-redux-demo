/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:14:01 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 17:15:24
 */

import 'package:douban_movie/page/home_page/action.dart';
import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  final GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();

  return Scaffold(
    appBar: AppBar(
      title: Text('douban'),
    ),
    body: EasyRefresh(
      key: _easyRefreshKey,
      child: GridView.builder(
        itemCount: listAdapter.itemCount,
        itemBuilder: listAdapter.itemBuilder,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.72),
      ),
      onRefresh: () {
        dispatch(HomeActionCreater.onRefreshAction());
      },
      loadMore: () {
        if (state.items?.length < state.total) dispatch(HomeActionCreater.onMoreAction());
      },
    ),
  );
}
