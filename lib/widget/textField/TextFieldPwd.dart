import 'package:flutter/material.dart';
import '../../constant/constant.dart';

typedef void ITextFieldCallBack(String content);

class PwdEditText extends StatefulWidget {
  final ITextFieldCallBack contentStrCallBack;

  const PwdEditText({Key key, this.contentStrCallBack}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PwdEditState();
  }
}

String _inputPassword = '';
bool _isShowDelete = false;

class _PwdEditState extends State<PwdEditText> {
  TextEditingController _controller = TextEditingController.fromValue(
      TextEditingValue(
          text: _inputPassword,
          selection: TextSelection.fromPosition(TextPosition(
              affinity: TextAffinity.downstream,
              offset: _inputPassword.length))));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _controller,
        style: TextStyle(color: Color(0xff333333), fontSize: 14),
        decoration: InputDecoration(
            counterText: '',
            hintText: '请输入密码',
            contentPadding: EdgeInsets.only(left: 0, top: 14, bottom: 14),
            hintStyle: TextStyle(color: Color(0xff8C8C8C), fontSize: 14),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffDADADA))),
            fillColor: Colors.transparent,
            filled: true,
            suffixIcon: _isShowDelete
                ? Container(
                    width: 14,
                    height: 14,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      iconSize: 14,
                      icon: Image.asset(
                        Constant.ASSETS_IMG + 'icon_et_delete.png',
                        width: 14,
                        height: 14,
                      ),
                      onPressed: () {
                        setState(() {
                          _inputPassword = '';
                          _isShowDelete = _inputPassword.isNotEmpty;
                          widget.contentStrCallBack(_inputPassword);
                        });
                      },
                    ),
                  )
                : Text('')),
        onChanged: (str) {
          setState(() {
            _inputPassword = str;
            _isShowDelete = _inputPassword.isNotEmpty;
            widget.contentStrCallBack(_inputPassword);
          });
        },
        keyboardType: TextInputType.text,
        maxLength: 20,
        maxLines: 1,
        obscureText: true, // password
      ),
    );
  }
}
