import 'package:flutter/material.dart';
import './weibo_homelist_page.dart';

class WeiBoFollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeiBoFollowPageState();
  }
}

class _WeiBoFollowPageState extends State<WeiBoFollowPage> {
  @override
  Widget build(BuildContext context) {
    return WeiBoHomeListPage(mCatId: '0');
  }
}
