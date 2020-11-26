import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';
import './Application.dart';

class Routes {
  static String index = "/";
  static String login = "/login";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(index, handler: indexHandler);
    router.define(login, handler: loginPageHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }
}
