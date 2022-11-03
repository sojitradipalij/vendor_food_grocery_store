import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/center_button.dart';
import '../../utils/common_textfield.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      editProfileController = controller;
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
    });
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
            "Edit Profile",
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 120.sp,
                  height: 120.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 25,
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          offset: Offset(3, 3))
                    ],
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(color: Color(0xFFDCFFDF), width: 2.sp),
                  ),
                  padding: EdgeInsets.all(25.sp),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Color(0xFF3AB659),
                    size: 63.sp,
                  ),
                ),
                Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      padding: EdgeInsets.all(7.sp),
                      decoration: BoxDecoration(
                          color: Color(0xFF3AB659),
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 15.sp,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text("    Name : "),
          SizedBox(
            height: 9.h,
          ),
          CommonTextfield(
              controller: editProfileController.nameController,
              hintText: "Enter Name",
              radius: 36.r),
          SizedBox(
            height: 20.h,
          ),
          Text("    Email Address :"),
          SizedBox(
            height: 9.h,
          ),
          CommonTextfield(
              controller: editProfileController.emailController,
              hintText: "Enter Email Address",
              radius: 36.r),
          SizedBox(
            height: 20.h,
          ),
          Text("    Mobile Number :"),
          SizedBox(
            height: 9.h,
          ),
          CommonTextfield(
              controller: editProfileController.mobileNumberController,
              hintText: "Enter Mobile Number",
              radius: 36.r),
          SizedBox(
            height: 35.h,
          ),
          Center(
            child: Container(
              width: 222.w,
              child: CenterButton(
                ontap: () {
                  Get.back();
                },
                text: "Update",
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
