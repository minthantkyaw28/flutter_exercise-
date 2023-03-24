class ShopModel {
  String? image;
  String? name;
  String? deliveryTime;
  double? distance;
  double? rating;
  String? categoryName;

  String? promotion;
  String? deliveryFree;
  String? discount;

  // ShopModel(
  //   this.image,
  //   this.name,
  //   this.deliveryTime,
  //   this.distance,
  //   this.rating,
  //   this.categoryName
  // );

  ShopModel(this.image, this.name, this.deliveryTime, this.distance,
      this.rating, this.categoryName,
      [this.promotion, this.deliveryFree, this.discount]);
}
