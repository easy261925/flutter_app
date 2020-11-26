import 'package:flutter/material.dart';
import './pages/splash_page.dart';
import './routes/Application.dart';
import './routes/routers.dart';
import 'package:fluro/fluro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // @override
  // Widget build(BuildContext context) {
  //   final router = FluroRouter();
  //   Routes.configureRoutes(router);
  //   Application.router = router;
  //
  //   return Container(
  //     child: MaterialApp(
  //         title: "演示demo",
  //         debugShowCheckedModeBanner: false,
  //         theme: ThemeData(primaryColor: Colors.white),
  //         onGenerateRoute: Application.router.generator,
  //         home: SplashPage()),
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MyApp> {
  AppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: "演示demo",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          onGenerateRoute: Application.router.generator,
          home: SplashPage()),
    );
  }
}
