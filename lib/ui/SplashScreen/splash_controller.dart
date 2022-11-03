import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/AuthScreen/auth_screen.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2),(){
     Get.to(const AuthScreen());
    });
    super.onInit();
  }

}