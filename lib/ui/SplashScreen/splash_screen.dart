import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_assets.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        splashController=controller;
        return Scaffold(
          body: Image.asset(splashImg,width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        );
      }
    );
  }
}
