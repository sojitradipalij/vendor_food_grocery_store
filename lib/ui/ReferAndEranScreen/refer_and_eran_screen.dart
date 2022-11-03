import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/center_button.dart';

class ReferAndEranScreen extends StatefulWidget {
  const ReferAndEranScreen({Key? key}) : super(key: key);

  @override
  State<ReferAndEranScreen> createState() => _ReferAndEranScreenState();
}

class _ReferAndEranScreenState extends State<ReferAndEranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          bgImagePath: backBg,
          child: Column(
            children: [
              appBar(),
              Expanded(child: bodyView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF3AB659),
              )),
          Expanded(
              child: Text(
                "Refer & Eran",
                style: blackExtraBold18.copyWith(color: Color(0xFF3AB659)),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            width: 25.w,
          )
        ],
      ),
    );
  }

  Widget bodyView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 32.h,),
          Image.asset(
            referErenImg,
            height: 300.h,
          ),
          SizedBox(height: 32.h,),
          Text("Refer & Eran",style: blackExtraBold18.copyWith(fontSize: 20.sp,color: Color(0xFF3E3E3E)),),
          SizedBox(height: 13.h,),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: blackRegular16.copyWith(color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
          SizedBox(
            height: 57.h,
          ),
          Center(
            child: Container(
              width: 222.w,
              child: CenterButton(
                ontap: () {
                  // Get.back();
                },
                text: "Refer friend",
                radius: 100.r,
                bgColor: Color(0xFF3AB659),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
