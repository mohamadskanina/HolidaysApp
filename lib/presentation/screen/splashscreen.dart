import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/constant/colorapp.dart';
import '../../core/constant/image_assets.dart';
import '../widget/splashscreen/custombody.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Lottie.asset(
                AppImageAssets.searching,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              const CustomBodySplashScreen()
            ],
          ),
        ),
      ),
    );
  }
}
