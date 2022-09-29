import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constant/yaers.dart';

import '../../../business_logic/cubit/country_cubit.dart';
import '../../../core/constant/colorapp.dart';
import '../../../core/constant/textstyleapp.dart';

class CustomDropDownYears extends StatefulWidget {
  const CustomDropDownYears({Key? key}) : super(key: key);

  @override
  State<CustomDropDownYears> createState() => _CustomDropDownYearsState();
}

class _CustomDropDownYearsState extends State<CustomDropDownYears> {
  String? val = AppYear.listOfYears.first;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.all(8.0),
        child: _buildDropDownYears());
  }

  _buildDropDownYears() {
    return DropdownButton<String>(
      dropdownColor: AppColor.backgroundColor,
      hint: Text(
        "Chosse Year",
        style: AppTextStyle.smallFont,
      ),
      autofocus: true,
      style: AppTextStyle.smallFont,
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
        size: 25,
      ),
      borderRadius: BorderRadius.circular(20),
      iconEnabledColor: AppColor.primaryColor,
      value: val,
      onChanged: (year) {
        setState(() {
          val = year;
        });
        BlocProvider.of<CountryCubit>(context).setYearValue(year!);
      },
      elevation: 4,
      items: AppYear.listOfYears.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e,
              textAlign: TextAlign.right,
            ),
          ),
        );
      }).toList(),
    );
  }
}
