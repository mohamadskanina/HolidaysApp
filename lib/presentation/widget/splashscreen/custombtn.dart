import 'package:flutter/material.dart';
import '../../../core/constant/colorapp.dart';
import '../../../core/constant/textstyleapp.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 70,
      width: double.infinity,
      child: MaterialButton(
          textColor: AppColor.textColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: AppColor.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          child: Text(
            "Continue",
            style: AppTextStyle.mediumFont,
          )),
    );
  }
}
