import 'package:get/get.dart';

import '../../Models/ProductModel.dart';
import '../../utils/app_assets.dart';

class ProductListController extends GetxController{

  List productList = [
    ProductModel(id: 0,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 1,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 2,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 3,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 4,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 5,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
  ];

}