import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';

import '../../../business_logic/cubit/country_cubit.dart';
import '../../../data/models/countrycodemodel.dart';

// ignore: must_be_immutable
class CustomDropDownCountries extends StatefulWidget {
  List<CountriesCodeModel> listOfCountriesCodeModel;
  String title;
  CustomDropDownCountries(
      {Key? key, required this.listOfCountriesCodeModel, required this.title})
      : super(key: key);

  @override
  State<CustomDropDownCountries> createState() =>
      _CustomDropDownCountriesState();
}

class _CustomDropDownCountriesState extends State<CustomDropDownCountries> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.all(8.0),
        child: _buildDropDownCountries());
  }

  _buildDropDownCountries() {
    return DropdownButton<String>(
      dropdownColor: AppColor.backgroundColor,
      hint: Text(
        widget.title,
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
      value: code,
      onChanged: (newval) {
        setState(() {
          code = newval;
        });
        BlocProvider.of<CountryCubit>(context).setCodeValue(code!);
      },
      elevation: 4,
      items: widget.listOfCountriesCodeModel.map((e) {
        return DropdownMenuItem<String>(
          value: e.countryShortName,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.countryName!,
              textAlign: TextAlign.right,
            ),
          ),
        );
      }).toList(),
    );
  }
}
