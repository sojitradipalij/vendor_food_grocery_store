import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/LoginScreen/login_screen.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/common_textfield.dart';
import '../PickLocationScreen/pick_location_screen.dart';
import 'signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        signUpController=controller;
        return Scaffold(
          body: Row(
            children: [
              Expanded(child: bodyView()),
              Container(
                height: double.infinity,
                color: Color(0xFF3AB659),
                width: 12.w,
              )
            ],
          ),
        );
      }
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Icon(Icons.arrow_back_ios_new)),
                  ),
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
                    "SIGN UP",
                    style: blackExtraBold18.copyWith(fontSize: 27.sp),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        facebookIcon,
                        height: 50.sp,
                        width: 50.sp,
                      ),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(
                        googleIcon,
                        height: 50.sp,
                        width: 50.sp,
                      ),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(
                        twitterIcon,
                        height: 50.sp,
                        width: 50.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Enter your details below to Sign up",
                    style: blackRegular16.copyWith(color: Color(0xFF7D7D7d)),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CommonTextfield(
                      controller: signUpController.nameController,
                      hintText: "Enter your Name"),
                  SizedBox(
                    height: 8.h,
                  ),
                  CommonTextfield(
                      controller: signUpController.mobileNumberController,
                      hintText: "Enter Number"),
                  SizedBox(
                    height: 8.h,
                  ),
                  CommonTextfield(
                      controller: signUpController.passwordController,
                      hintText: "Enter Password"),
                  SizedBox(
                    height: 18.h,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, bottom: 30.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style:
                        blackRegular16.copyWith(color: Color(0xFF7D7D7D)),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          " Log In",
                          style:
                          blackRegular16.copyWith(color: Color(0xFF3AB659)),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(PickLocationScreen());
                  },

                  child: Stack(
                    children: [
                      Image.asset(loginImg,height: 100.h,width: 110.w,alignment: Alignment.centerRight),
                      Positioned(
                          top: 37.h,
                          left: 38.w,
                          bottom: 0,
                          right: 0,
                          child: Text(
                            "Sign Up",
                            style: whiteBold14,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
