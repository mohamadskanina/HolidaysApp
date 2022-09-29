import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/presentation/widget/home/customcard.dart';
import '../../../core/constant/image_assets.dart';
import '../../../data/models/countrymodel.dart';

// ignore: must_be_immutable
class HolidaysPage extends StatefulWidget {
  List<CountryModel> listOfCountryModel;
  HolidaysPage({required this.listOfCountryModel, Key? key}) : super(key: key);

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundColor,
        height: MediaQuery.of(context).size.height / 1.4,
        child: buildBlockWidget(),
      ),
    );
  }

  buildBlockWidget() {
    if (widget.listOfCountryModel.isNotEmpty) {
      return buildLoadedListWidget();
    } else {
      return Lottie.asset(AppImageAssets.nodata);
    }
  }

  buildLoadedListWidget() {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        child: buildCountryList(),
      ),
    );
  }

  Widget buildCountryList() {
    return ListView.builder(
        itemCount: widget.listOfCountryModel.length,
        itemBuilder: (context, index) =>
            CustomCard(countryModel: widget.listOfCountryModel[index]));
  }
}
