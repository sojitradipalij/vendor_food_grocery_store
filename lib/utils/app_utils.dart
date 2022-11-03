import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

String? validateName(String? value) {
  /* String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return 'nameIsRequired'.tr();
  } else if (!regExp.hasMatch(value ?? '')) {
    return 'nameMustBeValid'.tr();
  }
  return null;*/
  if (value?.isEmpty ?? true) {
    return 'Name is required';
  } else if (value!.split(' ').length > 100) {
    return 'Reached max words';
  }
  return null;
}

String? validateMobile(String? value) {
  String pattern = r'(^\+?[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return null;
  } else if (!regExp.hasMatch(value ?? '')) {
    return 'Mobile Number must be digits';
  }
  return null;
}

String? validatePassword(String? value) {
  if ((value?.length ?? 0) < 6) {
    return 'Password must be more than 5 characters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value == null ? '' : value.trim())) {
    return 'Enter valid e-mail';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password doesn\'t match';
  } else if (confirmPassword?.isEmpty ?? true) {
    return 'Confirm password is required';
  } else {
    return null;
  }
}

const MaterialColor primaryMaterialColor = MaterialColor(
  0xFF1C1B1B,
  <int, Color>{
    50: Color(0xFF1C1B1B),
    100: Color(0xFF1C1B1B),
    200: Color(0xFF1C1B1B),
    300: Color(0xFF1C1B1B),
    400: Color(0xFF1C1B1B),
    500: Color(0xFF1C1B1B),
    600: Color(0xFF1C1B1B),
    700: Color(0xFF1C1B1B),
    800: Color(0xFF1C1B1B),
    900: Color(0xFF1C1B1B),
  },
);

const primaryColor = Color(0xFF1C1B1B);
const scaffoldBackgroundColor = Color(0xFF252836);
const blackColor = Color(0xFF1F1D2B);
const dividerColor = Color(0xFF393C49);
const secondTextColor = Color(0xFF76768B);

var blackRegular14 = TextStyle(
  color: Colors.black,
  fontSize: 14.sp,
);

TextStyle blackBold14 = TextStyle(
    color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w700);

var blackRegular16 = TextStyle(
  color: Colors.black,
  fontSize: 16.sp,
);

var blackRegular18 = TextStyle(
  color: Colors.black,
  fontSize: 18.sp,
);

var blackBold16 = TextStyle(
    color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700);

var blackBold18 = TextStyle(
    color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w700);

TextStyle blackExtraBold14 = TextStyle(
    color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w900);

var blackExtraBold16 = TextStyle(
    color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w900);

var blackExtraBold18 = TextStyle(
    color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w900);

var hintTextStyle = TextStyle(
  color: const Color(0xFFABBBC2),
  fontSize: 16.sp,
);

var whiteRegular14 = TextStyle(
  color: Colors.white,
  fontSize: 14.sp,
);

var whiteBold14 = TextStyle(
    color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w700);

var whiteRegular16 = TextStyle(
  color: Colors.white,
  fontSize: 16.sp,
);

var whiteBold16 = TextStyle(
    color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w700);

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}

loadingView() {
  return Center(
    child: SpinKitSpinningLines(
      color: const Color(0xFFA2866A),
      size: 40.h,
    ),
  );
}

//helper method to show progress
late ProgressDialog progressDialog;

showProgress(BuildContext context, String message, bool isDismissible) async {
  progressDialog = ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: isDismissible);
  progressDialog.style(
      message: message,
      borderRadius: 10.0,
      backgroundColor: primaryColor,
      progressWidget: Container(
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(
            Color(0xFFA2866A),
          ),
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(
          color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600));

  await progressDialog.show();
}

// showProgress(BuildContext context, String message, bool isDismissible) async {
//   progressDialog = ProgressDialog(context,
//       type: ProgressDialogType.Normal, isDismissible: isDismissible);
//   progressDialog.style(
//       message: message,
//       borderRadius: 10.0,
//       backgroundColor: Colors.white,
//       progressWidget: Image.asset("assets/DrivingWords.gif"),
//       elevation: 0.0,
//       insetAnimCurve: Curves.easeInOut,
//       messageTextStyle: const TextStyle(
//           color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600));
//
//   await progressDialog.show();
// }

updateProgress(String message) {
  progressDialog.update(message: message);
}

hideProgress() async {
  await progressDialog.hide();
}

showSnackBar(String message) {
  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}

//helper method to show alert dialog
showAlertDialog(String title, String content, bool addOkButton) {
  // set up the AlertDialog
  Widget? okButton;
  if (addOkButton) {
    okButton = TextButton(
      child: const Text('OK'),
      onPressed: () {
        Get.back();
      },
    );
  }
  if (Platform.isIOS) {
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [if (okButton != null) okButton],
    );
    showCupertinoDialog(
        context: Get.context!,
        builder: (context) {
          return alert;
        });
  } else {
    AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [if (okButton != null) okButton]);

    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

setTwoDigit(int number) {
  return number >= 10 ? "$number" : "0$number";
}

String formatTimestamp(int seconds, {bool lastSeen = false}) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  DateTime now = DateTime.now();
  DateTime justNow = now.subtract(const Duration(minutes: 1));
  DateTime localDateTime = dateTime.toLocal();
  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just now';
  }
  String roughTimeString = DateFormat('jm').format(dateTime);
  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return '${lastSeen ? 'on ' : ''}$roughTimeString';
  }
  DateTime yesterday = now.subtract(const Duration(days: 1));
  if (localDateTime.day == yesterday.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return '${lastSeen ? 'on ' : ''}Yesterday at $roughTimeString';
  }
  if (now.difference(localDateTime).inDays < 4) {
    String weekday = DateFormat('EEEE').format(localDateTime);
    return '${lastSeen ? 'on ' : ''}$weekday at $roughTimeString';
  }
  String date = DateFormat('MMMM d, ' 'yyyy').format(localDateTime);
  return '${lastSeen ? 'on ' : ''}$date';
}
