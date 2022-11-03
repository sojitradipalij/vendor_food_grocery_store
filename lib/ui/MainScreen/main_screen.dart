import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../CartScreen/cart_screen.dart';
import '../CategoryScreen/category_screen.dart';
import '../CompleteOrderScreen/complete_order_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../WishListScreen/WishListFolderScreen/wish_list_folder_screen.dart';
import 'main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      mainController = controller;
      return Scaffold(
        key: mainController.scaffoldKey,
        drawer: drawerView(),
        body: Column(
          children: [
            appBarView(),
            Expanded(child: bodyView()),
          ],
        ),
        bottomNavigationBar: bottomBar(),
      );
    });
  }

  Widget appBarView() {
    return Container(
      color: Color(0xFF3AB659),
      padding:
          EdgeInsets.only(top: 30.h, bottom: 10.h, left: 13.w, right: 13.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              mainController.scaffoldKey.currentState!.openDrawer();
            },
              child: SvgPicture.asset(drawerIcon)),
          Expanded(
              child: Image.asset(
            appbarImg,
            height: 54.h,
          )),
          InkWell(
            onTap: () {
              Get.to(ProfileScreen());
            },
              child: SvgPicture.asset(profileIcon)),
        ],
      ),
    );
  }

  Widget bodyView() {
    if(mainController.selectedIndex==0){
      return HomeScreen();
    }else if(mainController.selectedIndex==1){
      return CategoryScreen();
    }else if(mainController.selectedIndex==2){
      return WishListFolderScreen();
    }else if(mainController.selectedIndex==3){
      return CartScreen();
    }else {
      return HomeScreen();
    }
  }

  Widget bottomBar() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomBarItem(icon: homeIcon, index: 0),
          bottomBarItem(icon: catIcon, index: 1),
          bottomBarItem(icon: whichListIcon, index: 2),
          bottomBarItem(icon: cartIcon, index: 3),
        ],
      ),
    );
  }

  Widget bottomBarItem({var icon, var title, var index}) {
    return InkWell(
      onTap: () {
        mainController.updateIndex(index);
      },
      child: Container(
        alignment: Alignment.center,
        height: 60.w,
        child: Stack(
          children: [
            Center(
                child: Container(
                    width: 30.w,
                    child: SvgPicture.asset(icon,
                        height: mainController.selectedIndex == index
                            ? 22.sp
                            : 24.sp,
                        color: mainController.selectedIndex == index
                            ? Color(0xFF3AB659)
                            : secondTextColor))),
            if (mainController.selectedIndex == index)
              Center(
                child: Container(
                  width: 30.w,
                  height: 13.h,
                  margin: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                      color: Color(0xFF3AB659).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget drawerView(){
    return Drawer(
      width: 0.7.sw,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h,),
            Center(
                child: Image.asset(
                  groceryStoreImg,
                  width: 158.w,
                )),
            Divider(
              height: 50.h,
              endIndent: 30.w,
              indent: 30.w,
              color: Color(0xFF7D7D7D),
            ),
            drawerItem(title: "My Cart",onTap: (){
              mainController.scaffoldKey.currentState!.closeDrawer();
              mainController.updateIndex(3);
            }),
            drawerItem(title: "Complete Order",onTap: (){
              Get.to(CompleteOrderScreen());
            }),
            // drawerItem(title: "Change Language",onTap: (){}),
            drawerItem(title: "My List",onTap: (){
              mainController.scaffoldKey.currentState!.closeDrawer();
              mainController.updateIndex(2);
            }),
            // drawerItem(title: "FAQs",onTap: (){}),
            drawerItem(title: "Privacy Policy",onTap: (){}),
            drawerItem(title: "Term & Conditions",onTap: (){}),
            drawerItem(title: "Rate us",onTap: (){}),
            drawerItem(title: "About us",onTap: (){}),
          ],
        ),
      ),
    );
  }

  Widget drawerItem({required String title,var onTap}){
    return GestureDetector(
    onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Row(
            children: [
              Expanded(child: Text(title,style: blackRegular16,)),
              Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF3AB659),size: 18.sp,)
            ],
          ),
          SizedBox(height: 8.h,),
          Divider(
            endIndent: 45.w,
            color: Color(0xFF7D7D7D),
          ),
        ],
      ),
    );
  }

}
