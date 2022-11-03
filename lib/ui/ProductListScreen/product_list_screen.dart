import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';
import 'package:vendor_food_grocery_store/utils/center_button.dart';

import '../../Models/ProductModel.dart';
import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/common_textfield.dart';
import '../ProductDetailScreen/product_detail_screen.dart';
import 'product_list_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListController productListController =
      Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      productListController = controller;
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
            "Daily Needs Product",
            style: blackExtraBold18.copyWith(color: Color(0xFF3AB659)),
            textAlign: TextAlign.center,
          )),
          SvgPicture.asset(whichListIcon,
              height: 30.sp, color: Color(0xFF3AB659))
        ],
      ),
    );
  }

  Widget bodyView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          _searchView(),
          SizedBox(
            height: 13.h,
          ),
          _productList()
        ],
      ),
    );
  }

  Widget _searchView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.w).copyWith(top: 15.h),
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
    );
  }

  Widget _productList() {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      itemCount: productListController.productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.9.sp),
      itemBuilder: (BuildContext context, int index) {
        return productItemView(productListController.productList[index]);
      },
    );
  }

  Widget productItemView(ProductModel productModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailScreen(productModel: productModel,));
      },
      child: Container(
        margin: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(5, 6))
            ],
            borderRadius: BorderRadius.circular(10.r)),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(12.sp).copyWith(bottom: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopupMenuButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        itemBuilder: (context) => <PopupMenuEntry<dynamic>>[
                          PopupMenuItem<dynamic>(
                            value: 'Add Food Only',
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 30.w,
                                      child: SvgPicture.asset(whichListIcon,
                                          height: 25.sp,
                                          color: Color(0xFF3AB659)),
                                    ),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    Text(
                                      'Add Food Only',
                                      style: blackBold14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Divider(
                                  color: Color(0xFF7D7D7D),
                                  indent: 10.w,
                                  endIndent: 10.w,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<dynamic>(
                            value: 'Add to Wish List',
                            height: 45.h,
                            child: Row(
                              children: [
                                Container(
                                    width: 30.w,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF3AB659),
                                      size: 25.sp,
                                    )),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  'Add to Wish List',
                                  style: blackBold14,
                                ),
                              ],
                            ),
                          ),
                        ],
                        // initialValue: incomeTaxController!.selectedYear,
                        onSelected: (value) {
                          if (value == "Add to Wish List") {
                            addToWishListDialog(productModel);
                          }
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF3AB659),
                        ),
                      ),
                      Text(
                        "Rs. ${productModel.price}",
                        style: blackBold14.copyWith(color: Color(0xFF3AB659)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        productImg,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text("${productModel.name}",
                      style: blackBold14, textAlign: TextAlign.center),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rate ${productModel.rate}",
                        style: blackBold14.copyWith(
                            color: Color(0xFF7D7D7D), fontSize: 10.sp),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        child: IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: productModel.rate!,
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
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF48CF6A),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(10.r))),
                  padding: EdgeInsets.all(8.sp),
                  child: SvgPicture.asset(cartIcon1,
                      height: 16.sp, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  addToWishListDialog(ProductModel productModel) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: Color(0xFF3AB659),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.r),
                          topRight: Radius.circular(18.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(whichListIcon,
                            height: 25.sp, color: Colors.white),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "WISH LIST",
                          style: whiteRegular16.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(23.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("Enter list name :"),
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        CommonTextfield(
                          controller: TextEditingController(),
                          hintText: "",
                          fillColor: Color(0xFFF9F9F9),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 130.w,
                          child: CenterButton(
                            ontap: () {},
                            text: "Save",
                            radius: 100.r,
                            bgColor: Color(0xFF3AB659),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
