/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:55:30 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 13:29:27
 */

import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'effect.dart';
import 'view.dart';

class MovieItemComponent extends Component<ListItemState> {
  MovieItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
