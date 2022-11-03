import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  int selectedIndex = 0;

  updateIndex(index) {
    selectedIndex = index;
    update();
  }
}
