/*
 * @Author: leroylu 
 * @Date: 2019-04-22 11:06:40 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 11:08:22
 */

import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';

import 'package:douban_movie/page/home_page/page.dart';

Widget createApp() {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'home_page': HomePage()
      },
    ),
  ]);

  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('home_page', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}