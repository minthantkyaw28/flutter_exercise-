import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {
  late String? name;
  late String? brand;
  late String? imageUrl;
  late double? price;

  FoodListItem(this.name, this.brand, this.imageUrl, this.price, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Media Query

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width / 3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  brand!,
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  price.toString(),
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.network(imageUrl!),
            )
          ],
        ),
      ),
    );
  }
}
