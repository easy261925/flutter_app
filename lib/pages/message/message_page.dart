import 'package:flutter/material.dart';
import '../../constant/constant.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
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
                    child: Text('消息'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      Constant.ASSETS_IMG + 'icon_mine_add_friends.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
