/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:56:25 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 14:26:37
 */

import 'package:fish_redux/fish_redux.dart';

class ListItemState implements Cloneable<ListItemState> {
  String id;
  String name;
  String type;
  String bgImage;

  ListItemState({this.id, this.name, this.type, this.bgImage});

  @override
  ListItemState clone() {
    return ListItemState()
      ..id = id
      ..name = name
      ..type = type
      ..bgImage = bgImage;
  }
}
