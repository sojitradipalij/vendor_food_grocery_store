import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import '../../Models/CategoryModel.dart';
import '../../utils/common_textfield.dart';
import '../ProductListScreen/product_list_screen.dart';
import 'category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      categoryController = controller;
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
          height: 15.h,
        ),
        categoryView(),
        SizedBox(
          height: 20.h,
        ),
        mainCatView()
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

  Widget categoryView() {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ...List.generate(categoryController.categoryList.length, (index) {
          return catItemView(categoryController.categoryList[index]);
        })
      ],
    );
  }

  Widget catItemView(CategoryModel categoryModel) {
    return InkWell(
      onTap: () {
        Get.to(ProductListScreen());
      },
      child: Container(
        margin: EdgeInsets.all(5.sp),
        child: Image.asset(
          categoryModel.image!,
          width: 0.3.sw,
        ),
      ),
    );
  }

  Widget mainCatView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          mainCatItem(title: "Atta & Flours"),
          mainCatItem(title: "Snacks & Sweets"),
          mainCatItem(title: "Breakfast Cereals"),
          mainCatItem(title: "Salt & Sugar"),
          mainCatItem(title: "Special Flavours"),
        ],
      ),
    );
  }

  Widget mainCatItem({var title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(title,style: blackBold16,)),
              Icon(Icons.keyboard_arrow_up)
            ],
          ),
          Divider(indent: 15.w,endIndent: 15.w,color: Color(0xFFD5D5D5),),
        ],
      ),
    );
  }
}
