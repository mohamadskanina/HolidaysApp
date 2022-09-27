import 'package:flutter/material.dart';

import '../../../core/constant/colorapp.dart';
import '../../../core/constant/textstyleapp.dart';

PreferredSizeWidget myAppBar(String title) {
  return AppBar(
    backgroundColor: AppColor.backgroundColor,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.largeFont.copyWith(color: AppColor.primaryColor),
    ),
  );
}
