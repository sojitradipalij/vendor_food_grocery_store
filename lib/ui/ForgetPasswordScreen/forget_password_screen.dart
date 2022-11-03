import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/center_button.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/common_textfield.dart';
import '../OtpScreen/otp_creen.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (controller) {
      forgetPasswordController = controller;
      return Scaffold(
        appBar: appBar(),
        body: bodyView(),
      );
    });
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          )),
    );
  }

  Widget bodyView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 34.h,
          ),
          Center(
              child: Image.asset(
            groceryStoreImg,
            width: 158.w,
          )),
          SizedBox(
            height: 60.h,
          ),
          Text(
            "FORGET PASSWORD",
            style: blackExtraBold18.copyWith(fontSize: 27.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            "Enter your mobile number",
            style: blackRegular16.copyWith(color: Color(0xFF7D7D7d)),
          ),
          SizedBox(
            height: 50.h,
          ),
          CommonTextfield(
              controller: forgetPasswordController.mobileNumberController,
              hintText: "+91 25250 25250"),
          SizedBox(
            height: 45.h,
          ),
          Center(
            child: Container(
              width: 222.w,
              child: CenterButton(ontap: (){
                Get.to(OTPScreen());
              }, text: "Send Code",
                radius: 100.r,
                bgColor: Color(0xFF3AB659),
                fontWeight: FontWeight.bold,),
            ),
          )
        ],
      ),
    );
  }
}
