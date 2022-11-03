import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/PickLocationScreen/pick_location_controller.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import '../../utils/center_button.dart';
import '../MainScreen/main_screen.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  PickLocationController pickLocationController =
      Get.put(PickLocationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickLocationController>(builder: (controller) {
      pickLocationController = controller;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add current location",
                style: blackRegular16,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Location",
                style: blackExtraBold18.copyWith(fontSize: 27.sp),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Add your delivery location and continue",
                style: blackRegular16.copyWith(color: Color(0xFF7D7D7D)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        //map view
        mapView(),

        SizedBox(
          height: 30.h,
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Expanded(
                  child: CenterButton(
                ontap: () {
                  Get.to(MainScreen());
                },
                text: "Continue",
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
                        Get.to(MainScreen());
                      },
                      text: "Remind Later",
                      radius: 100.r,
                      txtColor: Color(0xFF878787),
                      bgColor: Color(0xFFFFFFFF),
                      shadowColor : Color(0x44878787),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
      ],
    );
  }

  Widget mapView() {
    return Expanded(
      child: Container(
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
