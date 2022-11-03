import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/LoginScreen/login_screen.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';
import 'package:vendor_food_grocery_store/utils/center_button.dart';

import '../../utils/app_assets.dart';
import '../PickLocationScreen/pick_location_screen.dart';
import '../SignUpScreen/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.to(PickLocationScreen());
                },
                child: Text(
                  "SKIP",
                  style: blackBold16.copyWith(fontSize: 18.sp),
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(authImg)),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MULTI VENDOR FOOD",
                    style: blackExtraBold16,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "GROCERY STORE",
                    style: blackExtraBold18.copyWith(fontSize: 27.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "More focused on a specific category of food or a targeted demographic, with a more limited variety.",
                    style: blackBold14.copyWith(color: Color(0xFF7D7D7D)),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: CenterButton(
                          ontap: () {
                            Get.to(LoginScreen());
                          },
                          text: "Login",
                          radius: 100.r,
                          bgColor: Color(0xFF3AB659),
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                            child: CenterButton(
                                ontap: () {
                                  Get.to(SignUpScreen());
                                },
                                text: "Sign Up",
                                radius: 100.r,
                                bgColor: Color(0xFFFAB333),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
