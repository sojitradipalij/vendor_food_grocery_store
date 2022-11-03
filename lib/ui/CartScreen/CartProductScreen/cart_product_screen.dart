import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Models/CartProductModel.dart';
import '../../../utils/BackgroundWidget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/center_button.dart';
import '../../PaymentSuccessScreen/payment_success_screen.dart';
import 'cart_product_controller.dart';

class CartProductScreen extends StatefulWidget {

  CartProductModel cartProductModel;

  CartProductScreen({Key? key,required this.cartProductModel}) : super(key: key);

  @override
  State<CartProductScreen> createState() => _CartProductScreenState();
}

class _CartProductScreenState extends State<CartProductScreen> {

  CartProductController cartProductController = Get.put(CartProductController());

  @override
  void initState() {
    cartProductController.getData(cartProductModel: widget.cartProductModel);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartProductController>(
      builder: (controller) {
        cartProductController=controller;
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
          // bottomNavigationBar: bottomBarView(),
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

  Widget bodyView(){
    if(cartProductController.cartProductModel==null){
      return Center(child: CircularProgressIndicator(),);
    }
    return ListView(
      children: [
        SizedBox(height: 20.h,),
        Image.asset(cartProductController.cartProductModel!.image!,height: 180.h,),
        SizedBox(height: 30.h,),
        productDetailsView(),
        SizedBox(height: 20.h,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Expanded(
                  child: CenterButton(
                    ontap: () {
                      Get.to(PaymentSuccessScreen());
                    },
                    text: "Payment",
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
                        Get.back();
                      },
                      text: "Cancel",
                      radius: 100.r,
                      bgColor: Colors.white,
                      txtColor: Color(0xFF878787),
                      shadowColor : Color(0x44878787),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
      ],
    );
  }

  Widget productDetailsView(){
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
      padding: EdgeInsets.all(15.sp),
      child: Column(
        children: [
          Text("Product Details",style: blackBold16,),
          SizedBox(height: 20.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_pin,color: Color(0xFF3AB659),),
              SizedBox(width: 10.w,),
              Expanded(child: Text("148/8, Amrapali Society, Vallabh Nagar,lic Colony, Mandapeshwar",style: blackRegular14.copyWith(fontSize: 12.sp),)),
              SizedBox(width: 10.w,),
              Icon(Icons.arrow_forward,color: Color(0xFF3AB659),),
            ],
          ),
          SizedBox(height: 20.h,),
          addPaymentMethod(),
          SizedBox(height: 20.h,),
          priceDetailsView(),
        ],
      ),
    );
  }

  Widget addPaymentMethod(){
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.credit_card_outlined,color: Color(0xFF3AB659),),
            SizedBox(width: 10.w,),
            Expanded(child: Text("ADD Payment Method",style: blackRegular14.copyWith(fontSize: 12.sp),)),
            SizedBox(width: 10.w,),
            Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF3AB659),),
          ],
        ),
        SizedBox(height: 10.h,),
        paymentItem(name: "Case on delivery",value: 0),
        paymentItem(name: "Online Banking",value: 1),
        paymentItem(name: "Use Cards",value: 2),
      ],
    );
  }

  Widget paymentItem({required String name,required int value}){
    return  Row(
      children: [
        SizedBox(width: 60.w,),
        Expanded(child: Text(name,style: blackRegular14.copyWith(fontSize: 12.sp,color: Color(0xFF666666)),)),
        SizedBox(width: 10.w,),
        SizedBox(
          height: 35.h,
          child: Radio(value: 0,
              fillColor: MaterialStateProperty.all<Color>(Color(0xFF3AB659)),
              groupValue: value, onChanged: (value){

          }),
        )
      ],
    );
  }

  Widget priceDetailsView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Details",style: blackExtraBold16.copyWith(color: Color(0xFF3E3E3E)),),
        SizedBox(height: 16.h,),
        Row(
          children: [
            Expanded(child: Text("Price",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),)),
            Text("${cartProductController.cartProductModel!.price!*cartProductController.cartProductModel!.itemCount!}/-",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Expanded(child: Text("Shipping Charges",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),)),
            Text("50/-",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Expanded(child: Text("Other Charges",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),)),
            Text("10/-",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Expanded(child: Text("Gst%",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),)),
            Text("12/-",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            Expanded(child: Text("More Text",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),)),
            Text("0/-",style: blackRegular14.copyWith(color: Color(0xFF666666),fontSize: 12.sp),),
          ],
        ),
        Divider(),
        Center(child: Text("Totale Rs.347.7",style: blackBold16.copyWith(color: Color(0xFF3AB659)),)),
      ],
    );
  }
}
