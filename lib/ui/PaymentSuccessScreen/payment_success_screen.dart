import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/MainScreen/main_screen.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import '../../utils/app_assets.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.offAll(MainScreen());
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(successImg,height: 160.sp,),
              Text("Payment Successfully",style: blackExtraBold16.copyWith(fontSize: 26.sp,color: Color(0xFF535353)),),
              SizedBox(height: 5.h,),
              Text("Thanks for order",style: blackRegular16.copyWith(color: Color(0xFF535353)),),
            ],
          ),
        ),
      ),
    );
  }
}
