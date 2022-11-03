import 'package:get/get.dart';

import '../../../Models/WishListModel.dart';

class WishListItemListController extends GetxController{

  WishListModel? wishListModel;

  getData({required WishListModel wishListModel}){
    this.wishListModel=wishListModel;
    update();
  }

  double getTotalKG(){
    return wishListModel!.wishListProducts!.fold(0, (previousValue, element) => previousValue+element.itemCount!);
  }

  double getTotalPrice(){
    return wishListModel!.wishListProducts!.fold(0, (previousValue, element) => previousValue+(element.price!*element.itemCount!));
  }

  addItem(int index){
    wishListModel!.wishListProducts![index].itemCount=wishListModel!.wishListProducts![index].itemCount!+1;
    update();
  }

  removeItem(int index){
    if(wishListModel!.wishListProducts![index].itemCount!>1){
      wishListModel!.wishListProducts![index].itemCount=wishListModel!.wishListProducts![index].itemCount!-1;
      update();
    }
  }

  deleteProduct(int index){
    wishListModel!.wishListProducts!.removeAt(index);
    update();
  }



}