import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../home/weibo_follow_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [Expanded(child: TabBarWidget())],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

TabController _controller;

class TabBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarWidgetState();
  }
}

class _TabBarWidgetState extends State<TabBarWidget> {
  final List<String> _tabValues = ['关注', '热门'];

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: _tabValues.length, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  color: Color(0xffF9F9F9),
                  alignment: Alignment.center,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Color(0xffFF3700),
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color(0xffFF3700), width: 2),
                      insets: EdgeInsets.only(bottom: 7),
                    ),
                    labelColor: Color(0xff333333),
                    unselectedLabelColor: Color(0xff666666),
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: TextStyle(fontSize: 16),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _controller,
                    tabs: [Tab(text: _tabValues[0]), Tab(text: _tabValues[1])],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Image.asset(
                      Constant.ASSETS_IMG + 'ic_main_add.png',
                      width: 40,
                      height: 40,
                    ),
                    onPressed: () {
                      // TODO 新建
                    },
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: _controller,
              children: [WeiBoFollowPage(), WeiBoFollowPage()],
            ))
          ],
        ),
      ),
    );
  }
}
