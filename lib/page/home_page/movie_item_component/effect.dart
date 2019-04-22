/*
 * @Author: leroylu 
 * @Date: 2019-04-22 13:09:10 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 13:11:21
 */

import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'action.dart';

Effect<ListItemState> buildEffect() {
  return combineEffects(<Object, Effect<ListItemState>>{
    ItemAction.query: _onQuery,
  });
}

void _onQuery(Action action, Context<ListItemState> ctx){
  
}