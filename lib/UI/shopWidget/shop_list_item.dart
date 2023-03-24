import 'package:flutter/material.dart';

class ShopListItem extends StatelessWidget {
  // const ShopListItem({super.key});
  late String? image;
  late String? name;
  late String? deliveryTime;
  late double? distance;
  late double? rating;
  late String? categoryName;

  late String? promotion;
  late String? deliveryFree;
  late String? discount;

  ShopListItem(
      this.image,
      this.name,
      this.deliveryTime,
      this.distance,
      this.rating,
      this.categoryName,
      this.promotion,
      this.deliveryFree,
      this.discount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Media Query

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width / 3,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Image
            Container(
              width: 120,
              height: 120,
              child: Image.network(image!),
            ),

            SizedBox(
              width: 10,
            ),
            //Text Group
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Promo Text

                Container(
                  color: Color.fromARGB(255, 243, 235, 214),
                  child: promotion != null
                      ? Text(
                          promotion!,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(""),
                ),
                SizedBox(
                  width: 30,
                ),
                //Heading Text
                Text(
                  name!,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 40,
                ),
                //delivery time,distance and rating row
                Row(
                  children: [
                    //delivery time
                    Text(
                      deliveryTime!,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //distance
                    Text(
                      distance!.toString() + " km",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    //rating
                    Container(
                      child: rating != null
                          ? Text(
                              rating!.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(""),
                    ),
                  ],
                ),
                SizedBox(
                  width: 70,
                ),
                //category text
                Text(
                  categoryName!,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 159, 159, 159),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 50,
                ),
                //deliveryFree and discount
                Row(
                  children: [
                    //deliveryFree
                    Container(
                      color: Color.fromARGB(255, 243, 235, 214),
                      child: deliveryFree != null
                          ? Text(
                              deliveryFree!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          : Text(""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //discount
                    Container(
                      color: Color.fromARGB(255, 243, 235, 214),
                      child: discount != null
                          ? Text(
                              discount!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          : Text(""),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
