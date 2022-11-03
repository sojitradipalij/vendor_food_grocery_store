import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import '../../../Models/WishListModel.dart';
import '../../../utils/common_textfield.dart';
import '../WishListItemListScreen/wishlist_item_list_screen.dart';
import 'wish_list_folder_controller.dart';

class WishListFolderScreen extends StatefulWidget {
  const WishListFolderScreen({Key? key}) : super(key: key);

  @override
  State<WishListFolderScreen> createState() => _WishListFolderScreenState();
}

class _WishListFolderScreenState extends State<WishListFolderScreen> {

  WishListFolderController wishListController = Get.put(WishListFolderController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListFolderController>(
      builder: (controller) {
        wishListController=controller;
        return Scaffold(
          body: bodyView(),
        );
      }
    );
  }

  Widget bodyView() {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        headerView(),
        SizedBox(
          height: 15.h,
        ),
        listViewWidget()
      ],
    );
  }

  Widget headerView() {
    return Stack(
      children: [
        Container(
          color: Color(0xFF3AB659),
          height: 90.h,
        ),
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: CommonTextfield(
                  controller: TextEditingController(),
                  hintText: "Search Product",
                  radius: 100.r,
                  prefixWidget: Container(
                      margin: EdgeInsets.only(left: 8.w),
                      child: Icon(
                        Icons.search,
                        size: 20.sp,
                        color: Color(0xFF7D7D7D),
                      ))),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        )
      ],
    );
  }

  Widget listViewWidget(){
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: wishListController.wishListData.length,
      itemBuilder: (context, index) {
      return itemView(index,wishListController.wishListData[index]);
    },);
  }

  Widget itemView(int index,WishListModel wishListModel){
    return InkWell(
      onTap: () {
        Get.to(WishListItemListScreen(wishListModel: wishListModel,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(3, 3))
            ],
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0,),
                Container(
                  height: 40.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF3AB659),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r),bottomLeft: Radius.circular(100.r))
                  ),
                  child: Text("List ${index+1}",style: whiteBold14.copyWith(fontWeight: FontWeight.w900),),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w),
                    child: Icon(Icons.more_horiz_outlined,size: 20.sp,)),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("${wishListModel.name}",style: blackBold14.copyWith(color: Color(0xFF3AB659),fontWeight: FontWeight.w700),)),
                      Text("${wishListModel.totalItem} item",style: blackExtraBold14.copyWith(fontSize: 12.sp),),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFD5D5D5),
                    thickness: 2.h,
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("Total",style: blackBold14.copyWith(color: Color(0xFF3AB659),fontWeight: FontWeight.w700),)),
                      Text("Rs. ${wishListModel.totalPrice}",style: blackExtraBold14.copyWith(fontSize: 12.sp),),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}
