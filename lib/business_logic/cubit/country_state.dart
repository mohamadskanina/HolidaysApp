part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoded extends CountryState {
  final List<CountryModel> listOfCountryModel;

  CountryLoded(this.listOfCountryModel);
}
