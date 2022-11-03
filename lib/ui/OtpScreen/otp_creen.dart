import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/center_button.dart';
import 'otp_controller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  OTPController otpController=Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPController>(
      builder: (controller) {
        otpController=controller;
        return Scaffold(
          appBar: appBar(),
          body: bodyView(),
        );
      }
    );
  }

  AppBar appBar(){
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

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(5.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xFF3AB659),
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: ListView(
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
            "ENTER 4 DIGIT NUMBER",
            style: blackExtraBold18.copyWith(fontSize: 27.sp),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            "Please enter your verification code send your mobile number",
            style: blackRegular16.copyWith(color: Color(0xFF7D7D7d)),
          ),
          SizedBox(
            height: 50.h,
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            // validator: (s) {
            //   return s == '2222' ? null : 'Pin is incorrect';
            // },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(
            height: 45.h,
          ),
          Center(
            child: Container(
              width: 222.w,
              child: CenterButton(ontap: (){

              }, text: "Continue",
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
