import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/sp_util.dart';
import '../constant/constant.dart';
import '../routes/routers.dart';
import '../utils/user_util.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // App启动时读取Sp数据，需要异步等待Sp初始化完成。
    SpUtil.getInstance();
    Future.delayed(new Duration(seconds: 1), () {
      if (!UserUtil.isLogin()) {
        Navigator.pop(context);
        Routes.navigateTo(context, Routes.login, clearStack: true);
      } else {
        Navigator.pop(context);
        Routes.navigateTo(context, Routes.index, clearStack: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 100),
                  child: Image.asset(
                    Constant.ASSETS_IMG + 'welcome_android_slogan.png',
                    width: 200.0,
                    height: 100.0,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Constant.ASSETS_IMG + 'welcome_android_logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
