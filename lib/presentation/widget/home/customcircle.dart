import 'package:flutter/material.dart';
import '../../../core/constant/colorapp.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: -50,
      child: Container(
        height: 260,
        width: 260,
        decoration: BoxDecoration(
            color: AppColor.secoundryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(260)),
      ),
    );
  }
}
