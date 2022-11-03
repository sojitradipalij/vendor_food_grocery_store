import 'package:get/get.dart';

import '../../Models/CartProductModel.dart';
import '../../utils/app_assets.dart';

class CartController extends GetxController{

  List<CartProductModel> cartProductsList = [
    CartProductModel(id: 0,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 1,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 2,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 3,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 3.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 4,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.5,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 5,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
    CartProductModel(id: 5,name: "Liqua Mango Icecream",catName: "Fresh Fruit",discount: 50,image: productImg,price: 250,rate: 4.0,itemCount: 2,imageList: [productImg1,productImg1,productImg],description: "Lorem Ipsum is simply dummy text of the printingand typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s"),
  ];


  addItem(int index){
    cartProductsList[index].itemCount=cartProductsList[index].itemCount!+1;
    update();
  }

  removeItem(int index){
    if(cartProductsList[index].itemCount!>1){
      cartProductsList[index].itemCount=cartProductsList[index].itemCount!-1;
      update();
    }
  }

}