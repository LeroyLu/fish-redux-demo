/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:04:53 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 17:37:06
 */

import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'reducer.dart';
import 'effect.dart';
import 'view.dart';
import '../home_page/list_adapter/adapter.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          reducer: buildReducer(),
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
            adapter: MovieListAdapter(),
          ),
          middleware: <Middleware<HomeState>>[
            logMiddleware(tag: 'douban'),
          ],
        );
}
