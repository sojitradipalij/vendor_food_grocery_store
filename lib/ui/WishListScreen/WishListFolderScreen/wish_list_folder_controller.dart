import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/Models/WishListModel.dart';

import '../../../utils/app_assets.dart';

class WishListFolderController extends GetxController{

  var wishListData=[
    WishListModel(name: "My Product List 1",totalItem: 5,totalPrice: 580,wishListProducts: wishListProducts),
    WishListModel(name: "My Product List 2",totalItem: 5,totalPrice: 580,wishListProducts: wishListProducts),
    WishListModel(name: "My Product List 3",totalItem: 5,totalPrice: 580,wishListProducts: wishListProducts),
    WishListModel(name: "My Product List 4",totalItem: 5,totalPrice: 580,wishListProducts: wishListProducts),
  ];

  static List<WishListProducts> wishListProducts = [
    WishListProducts(id: 0,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    WishListProducts(id: 1,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    WishListProducts(id: 2,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    WishListProducts(id: 3,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    WishListProducts(id: 4,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    WishListProducts(id: 5,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
  ];
}