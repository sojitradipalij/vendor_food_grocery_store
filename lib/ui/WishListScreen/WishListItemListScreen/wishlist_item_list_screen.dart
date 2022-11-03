import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Models/WishListModel.dart';
import '../../../utils/BackgroundWidget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_utils.dart';
import 'wishlist_item_list_controller.dart';

class WishListItemListScreen extends StatefulWidget {

  WishListModel wishListModel;

  WishListItemListScreen({Key? key,required this.wishListModel}) : super(key: key);

  @override
  State<WishListItemListScreen> createState() => _WishListItemListScreenState();
}

class _WishListItemListScreenState extends State<WishListItemListScreen> {

  WishListItemListController wishListItemListController = Get.put(WishListItemListController());


  @override
  void initState() {
    wishListItemListController.getData(wishListModel: widget.wishListModel);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListItemListController>(
      builder: (controller) {
        wishListItemListController=controller;
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
          bottomNavigationBar: bottomBarView(),
        );
      }
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
                "Wish List",
                style: blackExtraBold18.copyWith(color: Color(0xFF3AB659)),
                textAlign: TextAlign.center,
              )),
          SizedBox(width: 25.w,)
        ],
      ),
    );
  }

  Widget bottomBarView(){
    return Container(
      height: 80.h,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(width: 18.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Price :",style: blackBold14.copyWith(color: Color(0xFF9D9D9D)),),
                    Text(" ${wishListItemListController.getTotalKG().round()}kg",style: blackBold14.copyWith(color: Color(0xFF9D9D9D),fontSize: 10.sp),),
                  ],
                ),
                SizedBox(height: 2.h,),
                Text("Rs.${wishListItemListController.getTotalPrice()}/-",style: blackBold14.copyWith(color: Color(0xFF3AB659),fontSize: 25.sp),),
              ],
            ),
          ),
          Container(
            width: 180.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15.h),
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                color: Color(0xFF3AB659),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: Color(0xFF3AB659).withOpacity(0.4),
                      spreadRadius: 0,
                      offset: Offset(0, 6))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.r),
                  bottomLeft: Radius.circular(60.r),
                )
            ),
            child: Text("ADD CART",style: whiteBold14.copyWith(fontWeight: FontWeight.w900),),
          ),
          SizedBox(width: 12.w,),
        ],
      ),
    );
  }

  Widget bodyView(){
    if(wishListItemListController.wishListModel==null){
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
      padding: EdgeInsets.all(10.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h,),
          Text("${wishListItemListController.wishListModel!.name}",style: blackBold16,),
          Divider(height: 35.h,endIndent: 30.w,indent: 30.w),
          productListView(),
        ],
      ),
    );
  }

  Widget productListView(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: wishListItemListController.wishListModel!.wishListProducts!.length,
      itemBuilder: (context, index) {
      return productItemView(index: index,wishListProducts: wishListItemListController.wishListModel!.wishListProducts![index]);
    },);
  }

  Widget productItemView({required WishListProducts wishListProducts,required int index}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
      decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 4.w).copyWith(right: 0),
              child: Row(
                children: [
                  Image.asset(wishListProducts.image!,height: 45.h,),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${wishListProducts.name}",style: blackBold14,),
                        SizedBox(height: 4.h,),
                        Row(
                          children: [
                            Text("Rs.${wishListProducts.price}",style: blackBold14,),
                            SizedBox(width: 7.w,),
                            Text(
                              "Rate ${wishListProducts.rate}",
                              style: blackBold14.copyWith(
                                  color: Color(0xFF7D7D7D),fontSize: 10.sp),
                            ),
                            SizedBox(width: 4.w,),
                            IgnorePointer(
                              ignoring: true,
                              child: RatingBar.builder(
                                initialRating: wishListProducts.rate!,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15.sp,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      wishListItemListController.removeItem(index);
                    },
                    child: Container(
                      width: 25.sp,
                      height: 25.sp,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0EEE8),
                        borderRadius: BorderRadius.circular(3.r)
                      ),
                      child: Icon(Icons.remove,size: 18.sp,color: Color(0xFF3AB659),),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Text("${wishListProducts.itemCount}",style: blackBold14,),
                  SizedBox(width: 8.w,),
                  InkWell(
                    onTap: () {
                      wishListItemListController.addItem(index);
                    },
                    child: Container(
                      width: 25.sp,
                      height: 25.sp,
                      decoration: BoxDecoration(
                        color: Color(0xFF3AB659),
                        borderRadius: BorderRadius.circular(3.r)
                      ),
                      child: Icon(Icons.add,size: 18.sp,color: Colors.white,),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              wishListItemListController.deleteProduct(index);
            },
            child: Container(
              height: 70.h,
              width: 26.w,
              decoration: BoxDecoration(
                  color: Color(0xFF45D168),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: Icon(Icons.delete,color: Colors.white,size: 18,),
            ),
          )
        ],
      ),
    );
  }


}
