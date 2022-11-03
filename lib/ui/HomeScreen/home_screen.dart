import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/app_assets.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';
import 'package:vendor_food_grocery_store/utils/common_textfield.dart';

import '../../Models/BrandModel.dart';
import '../../Models/CategoryModel.dart';
import '../../Models/ProductModel.dart';
import '../ProductDetailScreen/product_detail_screen.dart';
import '../ProductListScreen/product_list_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      homeController = controller;
      return Scaffold(
        body: bodyView(),
      );
    });
  }

  Widget bodyView() {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        headerView(),
        SizedBox(
          height: 18.h,
        ),
        offerProductsView(),
        SizedBox(
          height: 18.h,
        ),
        topBrandsView(),
        SizedBox(
          height: 18.h,
        ),
        otherProductsView(),
      ],
    );
  }

  Widget headerView() {
    return Stack(
      children: [
        Container(
          color: Color(0xFF3AB659),
          height: 180.h,
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
                  child: Icon(Icons.search,size : 20.sp,color: Color(0xFF7D7D7D),))
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            categoryView(),
          ],
        )
      ],
    );
  }

  Widget categoryView() {
    return Container(
      height: 154.h,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10.w),
        itemCount: homeController.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return catItemView(homeController.categoryList[index]);
        },
      ),
    );
  }

  Widget catItemView(CategoryModel categoryModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductListScreen());
      },
      child: Container(
        margin: EdgeInsets.only(right: 15.w),
        child: Image.asset(categoryModel.image!,
            width: 108.w, height: double.infinity),
      ),
    );
  }

  Widget offerProductsView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer Products",
                      style: blackBold18.copyWith(color: Color(0xFF393939)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: 80.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3AB659),
                          borderRadius: BorderRadius.circular(10.r)),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ProductListScreen());
                },
                child: Text(
                  "More+",
                  style: blackBold14.copyWith(color: Color(0xFF3AB659)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          productView()
        ],
      ),
    );
  }

  Widget productView() {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      itemCount: homeController.productList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 0.8.sp
      ),
      itemBuilder: (BuildContext context, int index) {
        return productItemView(homeController.productList[index]);
      },
    );
  }

  Widget productItemView(ProductModel productModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailScreen(productModel: productModel,));
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFFDFF6E5),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.sp),
                      child: Image.asset(
                        productImg,
                        height: 68.h,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 30..sp,
                        width: 30..sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF7878),
                          borderRadius: BorderRadius.circular(100.r)
                        ),
                        child: Text("${productModel.discount!.round()}%",style: whiteBold14.copyWith(fontSize: 10.sp),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text("${productModel.name}",
                style: blackBold14, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget topBrandsView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Brands",
                      style: blackBold18.copyWith(color: Color(0xFF393939)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: 80.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3AB659),
                          borderRadius: BorderRadius.circular(10.r)),
                    )
                  ],
                ),
              ),
              // Text(
              //   "More+",
              //   style: blackBold14.copyWith(color: Color(0xFFFAB333)),
              // )
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            height: 140.sp,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: homeController.topBrandsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return topBrandsItemView(homeController.topBrandsList[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget topBrandsItemView(BrandModel brandModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductListScreen());
      },
      child: Container(
        width: 121.sp,
        height: 121.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(5, 6))
            ],
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(brandModel.image!,
              width: 121.w, height: double.infinity),
        ),
      ),
    );
  }

  Widget otherProductsView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Other Products",
                      style: blackBold18.copyWith(color: Color(0xFF393939)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: 80.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                          color: Color(0xFF3AB659),
                          borderRadius: BorderRadius.circular(10.r)),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ProductListScreen());
                },
                child: Text(
                  "More+",
                  style: blackBold14.copyWith(color: Color(0xFF3AB659)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          GridView.builder(
            padding: EdgeInsets.all(0),
            itemCount: homeController.productList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.0.sp
            ),
            itemBuilder: (BuildContext context, int index) {
              return otherProductItemView(homeController.productList[index]);
            },
          )
        ],
      ),
    );
  }

  Widget otherProductItemView(ProductModel productModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailScreen(productModel: productModel,));
      },
      child: Container(
        margin: EdgeInsets.all(8.sp),
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(5, 6))
            ],
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Rs. ${productModel.price}",style: blackBold14.copyWith(color: Color(0xFF3AB659)),),
              ],
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  productImg,
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              height: 7.h,
            ),
            Text("${productModel.name}",
                style: blackBold14, textAlign: TextAlign.center),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Text("Rate ${productModel.rate}",style: blackBold14.copyWith(color: Color(0xFF7D7D7D),fontSize: 10.sp),),
                SizedBox(width: 7.w,),
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
    );
  }

}
