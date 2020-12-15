import 'package:flutter/material.dart';
import '../../model/WeiBoModel.dart';

class WeiBoItemWidget extends StatelessWidget {
  WeiBoModel mModel;
  bool isDetail;

  WeiBoItemWidget(WeiBoModel data, bool isDetail) {
    mModel = data;
    isDetail = isDetail;
  }

  @override
  Widget build(BuildContext context) {
    return _wholeItemWidget(context, mModel, isDetail);
  }
}

Widget _wholeItemWidget(
    BuildContext context, WeiBoModel weiboItem, bool isDetail) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(weiboItem.username), Text(weiboItem.nickname)],
    ),
  );
}
