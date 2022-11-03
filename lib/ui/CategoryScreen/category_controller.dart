import 'package:get/get.dart';

import '../../Models/CategoryModel.dart';
import '../../utils/app_assets.dart';

class CategoryController extends GetxController{

  List categoryList = [
    CategoryModel(name: "Daily Needs Products", image: image1),
    CategoryModel(name: "Oil & Spices Products", image: image2),
    CategoryModel(name: "Personal Care Products", image: image3),
    CategoryModel(name: "Snacks Products", image: image4),
    CategoryModel(name: "Fruit And Vegetable", image: image5),
  ];

}