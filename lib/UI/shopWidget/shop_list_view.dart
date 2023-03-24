import 'package:flutter/material.dart';
import '../shopWidget/shop_list_item.dart';

import '../../constant/shop_const.dart';

class ShopListView extends StatefulWidget {
  const ShopListView({super.key});

  @override
  State<ShopListView> createState() => _ShopListViewState();
}

class _ShopListViewState extends State<ShopListView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
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
    );
  }
}
