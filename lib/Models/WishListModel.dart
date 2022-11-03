class WishListModel {
  String? name;
  int? totalItem;
  int? totalPrice;
  List<WishListProducts>? wishListProducts;

  WishListModel(
      {this.name, this.totalItem, this.totalPrice, this.wishListProducts});

  WishListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    totalItem = json['totalItem'];
    totalPrice = json['totalPrice'];
    if (json['wishListProducts'] != null) {
      wishListProducts = <WishListProducts>[];
      json['wishListProducts'].forEach((v) {
        wishListProducts!.add(new WishListProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['totalItem'] = this.totalItem;
    data['totalPrice'] = this.totalPrice;
    if (this.wishListProducts != null) {
      data['wishListProducts'] =
          this.wishListProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishListProducts {
  int? id;
  String? image;
  String? catName;
  String? name;
  int? discount;
  double? rate;
  int? price;
  String? description;
  List<String>? imageList;
  int? itemCount;

  WishListProducts(
      {this.id,
        this.image,
        this.catName,
        this.name,
        this.discount,
        this.rate,
        this.price,
        this.description,
        this.imageList,
        this.itemCount});

  WishListProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    catName = json['catName'];
    name = json['name'];
    discount = json['discount'];
    rate = json['rate'];
    price = json['price'];
    description = json['description'];
    imageList = json['imageList'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['catName'] = this.catName;
    data['name'] = this.name;
    data['discount'] = this.discount;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['description'] = this.description;
    data['imageList'] = this.imageList;
    data['itemCount'] = this.itemCount;
    return data;
  }
}
