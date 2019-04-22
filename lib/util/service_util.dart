/*
 * @Author: leroylu 
 * @Date: 2019-04-22 14:11:09 
 * @Last Modified by: leroylu
 * @Last Modified time: 2019-04-22 14:28:53
 */

import 'package:dio/dio.dart';

class Client {
  static Dio dio = Dio()
    ..options.baseUrl = 'https://api.douban.com';
    // ..options.responseType = ResponseType.bytes;
}
