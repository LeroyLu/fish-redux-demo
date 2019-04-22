/*
 * @Author: leroylu 
 * @Date: 2019-04-22 13:12:24 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 16:59:15
 */

import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'state.dart';
import 'action.dart';

Widget buildView(ListItemState state, Dispatch dispatch, ViewService viewService) {
  return Material(
    child: GestureDetector(
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: state.bgImage,
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0x00000000),
                    Color(0xFF000000),
                  ],
                  stops: [0.0, 0.9],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      state.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      state.type.replaceAll('[', '').replaceAll(']', '').replaceAll(',', ' '),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => println('click list item'),
    ),
  );
}
