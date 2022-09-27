import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/presentation/widget/appBar/myappbar.dart';
import 'package:myapp/presentation/widget/home/custombackground.dart';
import 'package:myapp/presentation/widget/home/customcard.dart';
import 'package:myapp/presentation/widget/home/customtext.dart';
import 'package:myapp/presentation/widget/home/dropdown.dart';

import '../../business_logic/cubit/country_cubit.dart';
import '../../core/constant/colorapp.dart';
import '../../core/constant/image_assets.dart';
import '../../data/models/countrymodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  late List<CountryModel> allCountries;

  @override
  void initState() {
    super.initState();
    allCountries = BlocProvider.of<CountryCubit>(context).getCountryFromModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      // appBar: myAppBar("Holidays App"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const CustomBackground(),
            Positioned(
                top: -50,
                right: -50,
                child: Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(260),
                    color: AppColor.backgroundColor.withOpacity(0.4),
                  ),
                )),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                // color: AppColor.textColor.withOpacity(1),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomText(),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            CustomDropDown(
                              list: const ["Syria", "Lebanon"],
                              title: "Chosse Country",
                            ),
                            CustomDropDown(
                              list: const ['2000', '2001', '2002'],
                              title: "Chosse Year",
                            ),
                          ],
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: buildBlockWidget())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildBlockWidget() {
    return BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
      if (state is CountryLoded) {
        allCountries = (state).listOfCountryModel;
        return buildLoadedListWidget();
      } else {
        return Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 200, height: 200));
      }
    });
  }

  buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: buildCountryList(),
      ),
    );
  }

  Widget buildCountryList() {
    return ListView.builder(
        itemCount: allCountries.length,
        itemBuilder: (context, index) =>
            CustomCard(countryModel: allCountries[index]));
  }
}
