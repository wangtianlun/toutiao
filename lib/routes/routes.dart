import 'package:flutter/material.dart';
import '../pages/home/index.dart';
import '../pages/detail/index.dart';
import '../pages/404/index.dart';

final routes = {
  '/': (context) => HomeIndexPage(),
  '/detail': (context, {arguments}) => DetailPage(arguments: arguments),
  '/404': (context) => NotFoundPage(),
};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    }
    return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
  }
  return MaterialPageRoute(builder: (context) => NotFoundPage());
};
