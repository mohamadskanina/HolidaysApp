part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoded extends CountryState {
  final List<CountryModel> listOfCountryModels;

  CountryLoded(this.listOfCountryModels);
}

class CountryCodeLoded extends CountryState {
  final List<CountriesCodeModel> listOfCountryCodeModel;

  CountryCodeLoded(this.listOfCountryCodeModel);
}

// ignore: must_be_immutable
class SearchHolidaysLoded extends CountryState {
  String code;
  String year;
  SearchHolidaysLoded(this.code, this.year);
}
