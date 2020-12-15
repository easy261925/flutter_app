import 'package:flutter/material.dart';
import '../../widget/loading_container.dart';
import '../../model/WeiBoModel.dart';
import '../../widget/weiboItem/WeiboItem.dart';
import '../../http/service_method.dart';
import '../../http/service_url.dart';

class WeiBoHomeListPage extends StatefulWidget {
  String mCatId = '';

  WeiBoHomeListPage({Key key, @required this.mCatId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WeiBoHomeListPageState();
  }
}

class _WeiBoHomeListPageState extends State<WeiBoHomeListPage> {
  bool isRefreshloading = false;
  bool isloadingMore = false; //是否显示加载中
  bool ishasMore = true; //是否还有更多
  num mCurPage = 1;
  ScrollController _scrollController = ScrollController();
  List<WeiBoModel> hotContentList = [];

  Future getSubDataRefresh() async {
    isloadingMore = false;
    ishasMore = true;
    mCurPage = 1;

    Map params = {
      'current': mCurPage,
      'pageSize': 10,
    };

    DioManager.getInstance().get(ServiceUrl.getUserList, params, (response) {
      print('res: ${response}');
      if(response['success']) {
        // TODO
      }
    }, (error) {
      print('error: ${error}');
    });
  }

  Widget _buildLoadMore() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: isRefreshloading,
        child: RefreshIndicator(
          onRefresh: getSubDataRefresh,
          child: ListView.builder(itemBuilder: (context, index) {
            if (index == hotContentList.length) {
              return _buildLoadMore();
            } else {
              return getContentItem(context, index, hotContentList);
            }
          }),
        ),
      ),
    );
  }

  getContentItem(BuildContext context, int index, List<WeiBoModel> mList) {
    WeiBoModel model = mList[index];
    return InkWell(
      onTap: () {},
      child: WeiBoItemWidget(model, false),
    );
  }
}
