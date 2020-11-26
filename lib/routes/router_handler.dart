import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/index_page.dart';
import '../pages/login_page.dart';

var indexHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

var loginPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});
