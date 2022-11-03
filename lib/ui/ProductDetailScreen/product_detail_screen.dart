import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Models/ProductModel.dart';
import '../../utils/BackgroundWidget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_utils.dart';
import '../../utils/center_button.dart';
import '../../utils/common_textfield.dart';
import 'product_detail_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel productModel;

  ProductDetailScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailController productDetailController =
      Get.put(ProductDetailController());

  @override
  void initState() {
    super.initState();
    productDetailController.getData(productData: widget.productModel);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      productDetailController = controller;
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              appBar(),
              Expanded(child: bodyView()),
            ],
          ),
        ),
        bottomNavigationBar: bottomBarView(),
      );
    });
  }

  Widget appBar() {
    return Container(
      color: Color(0xFFFFFDF9),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
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
          addToWishListView(widget.productModel),
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
                    Text(" ${productDetailController.totalKg}kg",style: blackBold14.copyWith(color: Color(0xFF9D9D9D),fontSize: 10.sp),),
                  ],
                ),
                SizedBox(height: 2.h,),
                Text("Rs.${productDetailController.totalKg*widget.productModel.price!}/-",style: blackBold14.copyWith(color: Color(0xFF3AB659),fontSize: 25.sp),),
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

  Widget bodyView() {
    return ListView(
      children: [
        imageSliderView(),
        productDetailView(),
        similarProducts(),
      ],
    );
  }

  Widget imageSliderView() {
    return Column(
      children: [
        Container(
            height: 285.h,
            decoration: BoxDecoration(
                color: Color(0xFFFFFDF9),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100.r))),
            child: CarouselSlider(
              carouselController:
                  productDetailController.carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    productDetailController.sliderCurrent = index;
                    productDetailController.update();
                  }),
              items: [
                ...List.generate(widget.productModel.imageList!.length,
                    (index) {
                  return sliderItem(widget.productModel.imageList![index]);
                })
              ],
            )),
        SizedBox(height: 15.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.productModel.imageList!
              .asMap()
              .entries
              .map((entry) {
            return GestureDetector(
              onTap: () => productDetailController.carouselController
                  .animateToPage(entry.key),
              child: Container(
                width: productDetailController.sliderCurrent ==
                    entry.key?22.w:12.w,
                height: 12.h,
                margin: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Color(0xFF4DED75).withOpacity(
                        productDetailController.sliderCurrent ==
                            entry.key
                            ? 1
                            : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  sliderItem(var image) {
    return Container(
      child: Image.asset(image),
    );
  }

  Widget productDetailView(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        children: [
          SizedBox(height: 30.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  productDetailController.removeKG();
                },
                child: Container(
                  height: 35.sp,
                  width : 35.sp,
                  decoration: BoxDecoration(
                    color: Color(0xFFE0EEE8),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Icon(Icons.remove,color: Color(0xFF3AB659),),
                ),
              ),
              SizedBox(width: 27.w,),
              Text("${productDetailController.totalKg}KG",style: blackBold14,),
              SizedBox(width: 27.w,),
              InkWell(
                onTap: () {
                  productDetailController.addKG();
                },
                child: Container(
                  height: 35.sp,
                  width : 35.sp,
                  decoration: BoxDecoration(
                    color: Color(0xFF3AB659),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productModel.name!,style: blackExtraBold18.copyWith(fontSize: 23.sp),),
                    SizedBox(height: 3.h,),
                    Text(widget.productModel.catName!,style: blackBold18.copyWith(color: Color(0xFF7D7D7D)),),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar.builder(
                      initialRating: widget.productModel.rate!,
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
                  SizedBox(height: 4.h,),
                  Text(
                    "Rate ${widget.productModel.rate}",
                    style: blackBold14.copyWith(
                        color: Color(0xFF7D7D7D)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h,),
          Text(widget.productModel.description!,style: blackRegular16.copyWith(color: Color(0xFF7D7D7D)),),
        ],
      ),
    );
  }

  Widget similarProducts(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22.h,),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 19.w),
            child: Text("Similar products",style: blackBold18,)),
        SizedBox(height: 18.h,),
        Container(
          height: 210.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 15.w),
            scrollDirection: Axis.horizontal,
             itemCount: productDetailController.similarProductsList.length,
            itemBuilder: (context, index) {
            return similarProductsItem(productDetailController.similarProductsList[index]);
          },),
        )
      ],
    );
  }

  Widget similarProductsItem(ProductModel itemData){
    return GestureDetector(
      onTap: () {
        print("object");
        Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productModel: itemData,)));
      },
      child: Container(
        width: 141.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.all(6.sp).copyWith(bottom: 12.h),
        padding: EdgeInsets.all(8.sp),
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Expanded(
                  child: Image.asset(itemData.image!,
                      width: 121.w, height: double.infinity),
                ),
                SizedBox(height: 7.h,),
                Text(itemData.name!,style: blackBold16,maxLines: 1,),
                SizedBox(height: 2.h,),
                Text(itemData.catName!,style: blackBold14.copyWith(color: Color(0xFF393939)),),
                Text("Rs.${itemData.price}/-",style: blackBold14.copyWith(color: Color(0xFF3AB659)),),
              ],
            ),
            Positioned(
              right: 0,
                child: addToWishListView(itemData)),
          ],
        ),
      ),
    );
  }

  Widget addToWishListView(ProductModel productModel){
    return  PopupMenuButton(
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
