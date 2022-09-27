import 'package:flutter/material.dart';
import '../../../core/constant/colorapp.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            )),
        Expanded(
            flex: 4,
            child: Container(
              color: AppColor.backgroundColor,
            )),
      ],
    );
  }
}
