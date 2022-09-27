import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';

class CustomDropDown extends StatefulWidget {
  List list;
  String title;
  CustomDropDown({Key? key, required this.list, required this.title})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = "three";
  String? cityChosse;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: (MediaQuery.of(context).size.width / 2) - 17,
      decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        dropdownColor: AppColor.backgroundColor,
        hint: Text(
          widget.title,
          style: AppTextStyle.smallFont,
        ),
        autofocus: true,
        style: AppTextStyle.smallFont,
        // isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 25,
        ),
        borderRadius: BorderRadius.circular(20),
        iconEnabledColor: AppColor.primaryColor,
        value: cityChosse,
        onChanged: (newval) {
          setState(
            () {
              cityChosse = newval;
            },
          );
        },
        elevation: 4,
        items: widget.list.map((e) {
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
      ),
    );
  }
}
