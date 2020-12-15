import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../../constant/constant.dart';
import '../../routes/routers.dart';
import '../../utils/user_util.dart';
import '../../model/UserModel.dart';
import '../../http/service_method.dart';
import '../../http/service_url.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
    if (UserUtil.isLogin()) {
      DioManager.getInstance().get(ServiceUrl.getUserInfo, null, (response) {
        if (response['success']) {
          var userInfo = {
            'id': response['data']['userInfo']['id'].toString(),
            'username': response['data']['userInfo']['username'],
            'nick': response['data']['userInfo']['nickname'],
            'token': UserUtil.getUserInfo().token,
          };
          UserUtil.saveUserInfo(userInfo);
        } else {
          Routes.navigateTo(context, Routes.login);
        }
      }, (error) {
        Routes.navigateTo(context, Routes.login);
      });
    }
  }

  @override
  void deactivate() {
    // TODO
    super.deactivate();
    var isTopRoute = ModalRoute.of(context).isCurrent;
    print('deactivate_____:$isTopRoute');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffEEEEEE),
        child: Column(
          children: [
            _buildTitle(context),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  UserUtil.getUserInfo().nick,
                  style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('退出登录?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('确定'),
                              onPressed: () {
                                UserUtil.loginout();
                                Navigator.of(context).pop();
                                Routes.navigateTo(context, '${Routes.login}',
                                    clearStack: true,
                                    transition: TransitionType.fadeIn);
                              },
                            ),
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                          backgroundColor: Colors.white,
                          elevation: 20,
                          // 设置成 圆角
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Center(
                      child: Text('退出',
                          style: TextStyle(fontSize: 14, color: Colors.red)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// 顶部标题
Widget _buildTitle(context) {
  return Container(
    padding: EdgeInsets.only(top: 10, bottom: 10),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              Constant.ASSETS_IMG + 'icon_mine_add_friends.png',
              width: 25,
              height: 25,
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: new Text(
              '我',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: InkWell(
                      child: Image.asset(
                        Constant.ASSETS_IMG + 'icon_mine_qrcode_2.png',
                        width: 25.0,
                        height: 25.0,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    child: InkWell(
                      child: Image.asset(
                        Constant.ASSETS_IMG + 'icon_mine_setting.png',
                        width: 25.0,
                        height: 25.0,
                      ),
                      onTap: () {
                        Routes.navigateTo(context, Routes.login); // TODO
                      },
                    ),
                  )
                ],
              )),
          flex: 1,
        ),
      ],
    ),
  );
}
