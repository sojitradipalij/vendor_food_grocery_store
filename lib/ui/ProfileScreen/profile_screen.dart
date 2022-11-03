import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/ui/ProfileScreen/profile_controller.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import '../../utils/app_assets.dart';
import '../CompleteOrderScreen/complete_order_screen.dart';
import '../EditProfileScreen/edit_profile_screen.dart';
import '../HelpCenterScreen/help_center_screen.dart';
import '../ReferAndEranScreen/refer_and_eran_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      profileController = controller;
      return Scaffold(
        body: bodyView(),
      );
    });
  }

  Widget bodyView() {
    return Column(
      children: [headerView(),
        SizedBox(
          height: 25.sp,
        ),
        itemView(icon: settingIcon,title: "Setting",onTap : (){}),
        itemView(icon: completeOrderIcon,title: "Complete Order",onTap : (){
          Get.to(CompleteOrderScreen());
        }),
        itemView(icon: helpCenterIcon,title: "Help Center",onTap : (){
          Get.to(HelpCenterScreen());
        }),
        itemView(icon: referEranIcon,title: "Refer & Eran",onTap : (){
          Get.to(ReferAndEranScreen());
        }),
        itemView(icon: logoutIcon,title: "Logout",onTap : (){}),
      ],
    );
  }

  Widget headerView() {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Color(0xFF3AB659),
                  width: double.infinity,
                  child: Image.asset(
                    profileBackImg,
                    height: 127.h,
                  ),
                  margin: EdgeInsets.only(bottom: 80.h),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120.sp,
                  height: 120.sp,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
              ),
            )
          ],
        ),
        Text(
          "Sumit More",
          style: blackExtraBold18.copyWith(
              color: Color(0xFF3AB659), fontSize: 24.sp),
        ),
        Text(
          "@usergmail1256022",
          style:
              blackBold14.copyWith(color: Color(0xFFA5A5A5), fontSize: 12.sp),
        ),
        SizedBox(height: 18.h,),
        InkWell(
          onTap: () {
            Get.to(EditProfileScreen());
          },
          child: Container(
            width: 85.w,
            height: 20.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF3AB659),
                borderRadius: BorderRadius.circular(60.r)),
            child: Text(
              "Edit Profile",
              style: whiteBold14.copyWith(fontSize: 10.sp),
            ),
          ),
        )
      ],
    );
  }

  Widget itemView({required var icon,required String title,var onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: Column(
          children: [
            Divider(
              color: Color(0xFF9A9A9A),
              endIndent: 30.w,
              indent: 30.w,
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x60BFE4C8),
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  padding: EdgeInsets.all(7.r),
                  child: SvgPicture.asset(icon,color: Color(0xFF43CC65),height: 22.sp,),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(child: Text(title,style: blackBold16,)),
                Container(
                  height: 30.sp,
                  width : 30.sp,
                  decoration: BoxDecoration(
                      color: Color(0x60BFE4C8),
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                  padding: EdgeInsets.all(6.r),
                  child: Icon(Icons.arrow_forward_ios_outlined,size: 20.sp,color: Color(0xFF43CC65),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
