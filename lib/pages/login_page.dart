import 'package:flutter/material.dart';
import 'package:flutter_app/http/service_method.dart';
import '../widget/textField/TextFieldAccount.dart';
import '../widget/textField/TextFieldPwd.dart';
import '../http/service_url.dart';
import '../utils/toast_util.dart';
import '../utils/user_util.dart';
import '../routes/routers.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

String _inputAccount = '';
String _inputPwd = '';

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DropdownButtonHideUnderline(
          child: ListView(
            children: [
              buildTile(context),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                child: Text(
                  '请输入账号密码',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: AccountEditText(
                  contentStrCallBack: (content) {
                    print('username: $content');
                    _inputAccount = content;
                    setState(() {});
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: PwdEditText(
                  contentStrCallBack: (content) {
                    _inputPwd = content;
                    setState(() {});
                  },
                ),
              ),
              buildLoginBtn(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTile(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '返回',
              style: TextStyle(fontSize: 16, color: Color(0xff6B91BB)),
            )),
        onTap: () {
          print('back');
          Navigator.pop(context);
        },
      ),
      InkWell(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            '帮助',
            style: TextStyle(fontSize: 16, color: Color(0xff6B91BB)),
          ),
        ),
        onTap: () {},
      )
    ],
  );
}

Widget buildLoginBtn(context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 60),
    child: RaisedButton(
      color: Color(0xffFF8200),
      textColor: Colors.white,
      disabledTextColor: Colors.white,
      disabledColor: Color(0xffFFD8AF),
      elevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      onPressed: _inputAccount.isEmpty || _inputPwd.isEmpty
          ? null
          : () {
              DioManager.getInstance().post(ServiceUrl.userLogin, {
                'username': _inputAccount,
                'password': _inputPwd,
                'type': 'account'
              }, (response) {
                print('response+++++++++++:$response');
                print(response['success']);
                if (response['success']) {
                  // TODO
                  UserUtil.saveUserInfo({
                    'id': '1',
                    'username': _inputAccount,
                    'nick': 'nick',
                    'token': response['data']['token'],
                    'auth': response['data']['currentAuthority']
                  });
                  ToastUtil.show('登录成功');
                  Navigator.pop(context);
                  Routes.navigateTo(context, Routes.index);
                } else {
                  ToastUtil.show(response['message']);
                }
              }, (error) {
                print('error____:$error');
              });
              // Navigator.pop(context);
              // Routes.navigateTo(context, Routes.home);
            },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          '登  录',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}
