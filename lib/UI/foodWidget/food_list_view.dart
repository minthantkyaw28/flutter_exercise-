import 'package:app_1/UI/foodWidget/food_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../constant/food_const.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({super.key});

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  //
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int max_count = 10;

  //data from constant from model
  List<dynamic> foodList = [];

  @override
  void initState() {
    for (int i = 0; i < max_count; i++) {
      foodList.add(FOODLIST[i]);
    }
  }

  void _getMoreList(int nextCount) {
    print("Getting next itmes");
    for (int i = max_count; i < nextCount; i++) {
      foodList.add(FOODLIST[i]);
    }
    max_count = nextCount;
    setState(() {});
  }

  void _onRefreshList() {
    foodList.clear();
    setState(() {});
    for (int i = 0; i < max_count; i++) {
      foodList.add(FOODLIST[i]);
    }
  }

  // void _initDataLoad() {
  //   for (int i = max_count; i < max_count; i++) {
  //     foodList.add(FOODLIST[i]);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //Media Query
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
          if (max_count == FOODLIST.length) {
            refreshController.loadNoData();
          } else {
            Future.delayed(Duration(microseconds: 1000), () {
              _getMoreList(max_count + 10);
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
            itemCount: foodList.length,
            itemBuilder: (BuildContext context, int index) {
              return FoodListItem(
                FOODLIST[index].name,
                FOODLIST[index].brand,
                FOODLIST[index].image,
                FOODLIST[index].price,
              );
            }),
      ),
    );
  }
}
