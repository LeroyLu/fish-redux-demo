/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:41:46 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 13:10:49
 */

import 'package:fish_redux/fish_redux.dart';

enum ItemAction { query }

class ItemActionCreator{
  static Action query(String id){
     return Action(ItemAction.query, payload: {'id': id});
  }
}
