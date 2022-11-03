import 'package:get/get.dart';

import '../../../Models/CartProductModel.dart';

class CartProductController extends GetxController{

  CartProductModel? cartProductModel;

  getData({required CartProductModel cartProductModel}){
    this.cartProductModel=cartProductModel;
  }

}