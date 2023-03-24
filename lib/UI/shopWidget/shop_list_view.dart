import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shopWidget/shop_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../constant/shop_const.dart';

class ShopListView extends StatefulWidget {
  const ShopListView({super.key});

  @override
  State<ShopListView> createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int max_count = 15;

  //data from constant from model
  List<dynamic> shopList = [];

  @override
  void initState() {
    for (int i = 0; i < max_count; i++) {
      shopList.add(SHOPLIST[i]);
    }
  }

  void _getMoreList(int nextCount) {
    print("Getting next itmes");
    for (int i = max_count; i < nextCount; i++) {
      shopList.add(SHOPLIST[i]);
    }
    max_count = nextCount;
    setState(() {});
  }

  void _onRefreshList() {
    shopList.clear();
    setState(() {});
    for (int i = 0; i < max_count; i++) {
      shopList.add(SHOPLIST[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        physics: const AlwaysScrollableScrollPhysics(),
        header: const WaterDropHeader(),
        controller: refreshController,
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body = Container();

            if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.noMore) {
              body = const Text("No More Data");
            }

            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onLoading: () {
          if (max_count == SHOPLIST.length) {
            refreshController.loadNoData();
          } else {
            Future.delayed(Duration(microseconds: 1000), () {
              _getMoreList(max_count + 15);
            });
            refreshController.loadComplete();
          }
        },
        onRefresh: () {
          _onRefreshList();
          refreshController.refreshCompleted();
        },
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: SHOPLIST.length,
            itemBuilder: (BuildContext context, int index) {
              return ShopListItem(
                SHOPLIST[index].image,
                SHOPLIST[index].name,
                SHOPLIST[index].deliveryTime,
                SHOPLIST[index].distance,
                SHOPLIST[index].rating,
                SHOPLIST[index].categoryName,
                SHOPLIST[index].promotion,
                SHOPLIST[index].deliveryFree,
                SHOPLIST[index].discount,
              );
            }),
      ),
    );
  }
}
