import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/image_assets.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppImageAssets.searching,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
