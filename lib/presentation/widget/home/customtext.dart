import 'package:flutter/material.dart';
import '../../../core/constant/colorapp.dart';
import '../../../core/constant/textstyleapp.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "We wish you happy holidays",
        style: AppTextStyle.h1Font.copyWith(
          color: AppColor.backgroundColor,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
