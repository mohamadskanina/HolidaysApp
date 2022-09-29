import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/data/models/countrycodemodel.dart';
import 'package:myapp/presentation/widget/home/custom_dropdown_yaers.dart';
import 'package:myapp/presentation/widget/home/custombackground.dart';
import 'package:myapp/presentation/widget/home/customcircle.dart';
import 'package:myapp/presentation/widget/home/customtext.dart';
import 'package:myapp/presentation/widget/home/dropdown.dart';
import '../../business_logic/cubit/country_cubit.dart';
import '../../core/constant/colorapp.dart';
import '../../core/constant/image_assets.dart';
import '../../data/models/countrymodel.dart';
import '../widget/home/holidays.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CountriesCodeModel> listOfCountriesCodeModel = [];
  // String code = "0";
  // String year = "0";
  List<CountryModel> listOfCountryModel = [];
  @override
  void initState() {
    super.initState();
    listOfCountriesCodeModel = BlocProvider.of<CountryCubit>(context)
        .getCountryCodeFromModelFromCubit();
    listOfCountryModel = BlocProvider.of<CountryCubit>(context).getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor, body: _buildHomeBody());
  }

  _buildDropDownList() {
    return BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
      if (state is CountryCodeLoded) {
        listOfCountriesCodeModel = (state).listOfCountryCodeModel;
        return CustomDropDownCountries(
            listOfCountriesCodeModel: listOfCountriesCodeModel,
            title: "Choose a city");
      } else {
        return CustomDropDownCountries(
            listOfCountriesCodeModel: listOfCountriesCodeModel,
            title: "Choose a city Loading");
      }
    });
  }

  _buildDataList() {
    return Expanded(
      flex: 3,
      child: Container(
          color: AppColor.backgroundColor,
          child: BlocBuilder<CountryCubit, CountryState>(
              builder: (context, state) {
            if (state is SearchHolidaysLoded) {
              // code = (state).code;
              // year = (state).year;
              listOfCountryModel =
                  BlocProvider.of<CountryCubit>(context).getList();
              return listOfCountryModel.isEmpty
                  ? Lottie.asset(AppImageAssets.nodata)
                  : HolidaysPage(
                      listOfCountryModel: listOfCountryModel,
                    );
            } else {
              listOfCountryModel =
                  BlocProvider.of<CountryCubit>(context).getList();
              return HolidaysPage(
                listOfCountryModel: listOfCountryModel,
              );
            }
          })),
    );
  }

  _buildDropDownBody() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          _buildDropDownList(),
          const SizedBox(
            height: 5,
          ),
          const CustomDropDownYears()
        ],
      ),
    );
  }

  _buildHomeBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const CustomBackgroundHomePage(),
          const CustomCircle(),
          Container(
            margin: const EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CustomText(),
                _buildDropDownBody(),
                _buildDataList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
