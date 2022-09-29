import 'package:flutter/material.dart';
import '../../../core/constant/colorapp.dart';

class CustomBackgroundHomePage extends StatelessWidget {
  const CustomBackgroundHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            height: MediaQuery.of(context).size.height / 2.1,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 7.9,
            color: AppColor.backgroundColor,
          ),
        ],
      ),
    );
  }
}
