import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/CartProductModel.dart';
import '../../utils/app_utils.dart';
import '../../utils/common_textfield.dart';
import 'CartProductScreen/cart_product_screen.dart';
import 'cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        cartController=controller;
        return Scaffold(
          body: bodyView(),
        );
      }
    );
  }

  Widget bodyView() {
    return Column(
      // padding: EdgeInsets.all(0),
      children: [
        headerView(),
        SizedBox(
          height: 15.h,
        ),
        Expanded(child: listViewWidget())
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
      padding: EdgeInsets.all(0),
      itemCount: cartController.cartProductsList.length,
      itemBuilder: (context, index) {
        return productItemView(index: index,cartProductModel: cartController.cartProductsList[index]);
      },);
  }

  Widget productItemView({required CartProductModel cartProductModel,required int index}){
    return InkWell(
      onTap: () {
        Get.to(CartProductScreen(cartProductModel: cartProductModel,));
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
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
          child: Row(
            children: [
              Image.asset(cartProductModel.image!,height: 66.h,),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${cartProductModel.name}",style: blackBold14,),
                    SizedBox(height: 4.h,),
                    Row(
                      children: [
                        Text(
                          "Rate ${cartProductModel.rate}",
                          style: blackBold14.copyWith(
                              color: Color(0xFF7D7D7D),fontSize: 10.sp),
                        ),
                        SizedBox(width: 4.w,),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: cartProductModel.rate!,
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
                    Row(
                      children: [
                        Expanded(child: Text("Rs.${cartProductModel.price}",style: blackBold14.copyWith(color: Color(0xFF3AB659)),)),
                        InkWell(
                          onTap: () {
                            cartController.removeItem(index);
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
                        Text("${cartProductModel.itemCount}",style: blackBold14,),
                        SizedBox(width: 8.w,),
                        InkWell(
                          onTap: () {
                            cartController.addItem(index);
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
