import 'package:get/get.dart';

import '../../Models/BrandModel.dart';
import '../../Models/CategoryModel.dart';
import '../../Models/ProductModel.dart';
import '../../utils/app_assets.dart';

class HomeController extends GetxController {
  List categoryList = [
    CategoryModel(name: "Daily Needs Products", image: image1),
    CategoryModel(name: "Oil & Spices Products", image: image2),
    CategoryModel(name: "Personal Care Products", image: image3),
    CategoryModel(name: "Snacks Products", image: image4),
    CategoryModel(name: "Fruit And Vegetable", image: image5),
  ];


  List productList = [
    ProductModel(id: 0,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 1,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 2,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 3,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 4,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    ProductModel(id: 5,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
  ];

  List topBrandsList =[
    BrandModel(id: 0,name: "dove",image: brandImg),
    BrandModel(id: 1,name: "dove",image: brandImg),
    BrandModel(id: 2,name: "dove",image: brandImg),
  ];

}
