import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_food_grocery_store/utils/app_utils.dart';

import 'ui/SplashScreen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  Widget build(BuildContext context) {

    final queryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    // final height = queryData.size.height;
    final screenWidth = queryData.size.width;

    print("screenWidth ${screenWidth}");

    return ScreenUtilInit(
      designSize: screenWidth<=428?const Size(414, 896):const Size(630, 970),
      builder: (buildContext,_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Vendor Food Grocery Store',
          theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFFF8F8F8),
              primarySwatch: primaryMaterialColor,
              fontFamily: "Lato"
          ),
          builder: (context, widget) {
            //add this line
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          home: const SplashScreen(),
        );
      },
    );
  }

}
