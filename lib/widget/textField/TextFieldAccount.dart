import 'package:flutter/material.dart';
import '../../constant/constant.dart';

typedef void ITextFieldCallBack(String content);

class AccountEditText extends StatefulWidget {
  final ITextFieldCallBack contentStrCallBack;

  const AccountEditText({Key key, this.contentStrCallBack}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountEditTextState();
  }
}

String _inputAccount = '';
bool _isShowDelete = true;

class _AccountEditTextState extends State<AccountEditText> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController.fromValue(
        TextEditingValue(
            text: _inputAccount,
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _inputAccount.length))));
    return Container(
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent, // 去除水波纹效果
        ),
        child: TextField(
          controller: _controller,
          style: TextStyle(color: Color(0xff333333), fontSize: 14),
          decoration: InputDecoration(
            counterText: '',
            hintText: '手机号或者邮箱',
            contentPadding: EdgeInsets.only(left: 0, top: 14, bottom: 14),
            hintStyle: TextStyle(color: Color(0xff8C8C8C), fontSize: 14),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDADADA)),
            ),
            fillColor: Colors.transparent,
            filled: true,
            // prefixIcon: widget.prefixIcon,
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
                          _inputAccount = '';
                          _isShowDelete = (_inputAccount.isNotEmpty);
                          widget.contentStrCallBack(_inputAccount);
                        });
                      },
                    ),
                  )
                : Text(''),
          ),
          onChanged: (str) {
            setState(() {
              _inputAccount = str;
              _isShowDelete = _inputAccount.isNotEmpty;
              widget.contentStrCallBack(_inputAccount);
            });
          },
          keyboardType: TextInputType.text,
          maxLength: 20,
          maxLines: 1,
        ),
      ),
    );
  }
}
