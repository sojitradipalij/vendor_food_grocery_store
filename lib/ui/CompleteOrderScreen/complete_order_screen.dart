import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/OrderModel.dart';
import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import 'complete_order_controller.dart';

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {

  CompleteOrderController completeOrderController = Get.put(CompleteOrderController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteOrderController>(
      builder: (controller) {
        completeOrderController=controller;
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
                "Complete Order",
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


  Widget bodyView(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: completeOrderController.orderModelList.length,
      itemBuilder: (context, index) {
        return productItemView(index: index,orderModel: completeOrderController.orderModelList[index]);
      },);
  }

  Widget productItemView({required OrderModel orderModel,required int index}){
    return Container(
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
            Image.asset(orderModel.image!,height: 66.h,),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${orderModel.name}",style: blackBold14,),
                  SizedBox(height: 4.h,),
                  Row(
                    children: [
                      Text(
                        "Rate ${orderModel.rate}",
                        style: blackBold14.copyWith(
                            color: Color(0xFF7D7D7D),fontSize: 10.sp),
                      ),
                      SizedBox(width: 4.w,),
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          initialRating: orderModel.rate!,
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
                  Text("Rs.${orderModel.price}",style: blackBold14.copyWith(color: Color(0xFF3AB659)),),
                ],
              ),
            ),
            Image.asset(successImg,height: 30.sp,),
          ],
        ),
      ),
    );
  }

}
