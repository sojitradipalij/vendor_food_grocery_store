import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
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
            "Help Center",
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
          Image.asset(
            helpCenterImg,
            height: 300.h,
          ),
          SizedBox(height: 32.h,),
          Text("What Issue are you facing ?",style: blackExtraBold18.copyWith(fontSize: 20.sp,color: Color(0xFF3E3E3E)),),
          SizedBox(height: 13.h,),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",style: blackRegular16.copyWith(color: Color(0xFF7D7D7D)),textAlign: TextAlign.center,),
          SizedBox(height: 32.h,),
          Row(
            children: [
              Expanded(child: Text("What Issue are you facing ?",style: blackBold16.copyWith(color: Color(0xFF3E3E3E)),)),
              Icon(Icons.arrow_forward_ios_outlined,size: 20.sp,),
            ],
          ),
          SizedBox(height: 17.h,),
          Row(
            children: [
              Expanded(child: Text("What Issue are you facing ?",style: blackBold16.copyWith(color: Color(0xFF3E3E3E)),)),
              Icon(Icons.arrow_forward_ios_outlined,size: 20.sp,),
            ],
          ),
        ],
      ),
    );
  }
}
