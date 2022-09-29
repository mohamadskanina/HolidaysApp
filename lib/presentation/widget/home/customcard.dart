import 'package:flutter/material.dart';

import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/data/models/countrymodel.dart';
import 'package:myapp/presentation/screen/holidaysdetail.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CountryModel countryModel;
  CustomCard({Key? key, required this.countryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      color: AppColor.backgroundColor,
      shadowColor: AppColor.primaryColor,
      child: _builListTile(context),
    );
  }

  _builListTile(context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => HolidaysDetail(countryModel: countryModel)));
      },
      title: Text(
        countryModel.name!,
        style: AppTextStyle.mediumFont,
      ),
      subtitle: Text(
        countryModel.date!,
        style: AppTextStyle.mediumFont,
      ),
      leading: Icon(
        Icons.location_city_rounded,
        color: AppColor.primaryColor,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColor.secoundryColor,
      ),
    );
  }
}
