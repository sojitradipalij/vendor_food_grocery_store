class OrderModel {
  int? id;
  String? image;
  String? catName;
  String? name;
  int? discount;
  double? rate;
  int? price;
  String? description;
  List<String>? imageList;

  OrderModel(
      {this.id,
        this.image,
        this.catName,
        this.name,
        this.discount,
        this.rate,
        this.price,
        this.description,
        this.imageList});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    catName = json['catName'];
    name = json['name'];
    discount = json['discount'];
    rate = json['rate'];
    price = json['price'];
    description = json['description'];
    imageList = json['imageList'];
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
    return data;
  }
}
