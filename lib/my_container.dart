import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget? child;
  final Color? renk;
  void Function()? onPress;
  MyContainer({this.renk = Colors.white, this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: renk,
        ),
      ),
    );
  }
}