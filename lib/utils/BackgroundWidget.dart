import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {

  final String bgImagePath;
  final Widget child;
  const BackgroundWidget({Key? key, required this.bgImagePath, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImagePath),
              fit: BoxFit.fill)),
      child: child,
    );
  }
}