import 'package:flutter/material.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/data/models/countrymodel.dart';
import 'package:myapp/presentation/widget/home/custombackground.dart';
import 'package:myapp/presentation/widget/home/customcircle.dart';

// ignore: must_be_immutable
class HolidaysDetail extends StatelessWidget {
  CountryModel countryModel;
  HolidaysDetail({required this.countryModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Container(
          alignment: Alignment.center,
          child: Stack(children: [
            const CustomBackgroundHomePage(),
            const CustomCircle(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  countryModel.name!,
                  style: AppTextStyle.h1Font
                      .copyWith(color: AppColor.backgroundColor),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                _buildCardData("Holidays Date    ", countryModel.date!),
                _buildCardData("Local Name       ", countryModel.localName!),
                _buildCardData("Holidays Type    ", countryModel.type!),
                _buildCardData("Country Code     ", countryModel.countryCode!),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ]),
        ));
  }

  _buildCardData(String title, String data) {
    return Card(
      color: AppColor.backgroundColor,
      shadowColor: AppColor.primaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: AppTextStyle.mediumFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              data,
              style: AppTextStyle.mediumFont.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
