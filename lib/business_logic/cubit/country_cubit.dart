import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/models/countrymodel.dart';

import '../../data/models/countrycodemodel.dart';
import '../../data/repository/country_code_repository.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryCodeRepository countryRepository;
  String code = "0";
  String year = "0";
  List<CountryModel> countries = [];
  List<CountriesCodeModel> countriesCode = [];

  CountryCubit(this.countryRepository) : super(CountryInitial());

  List<CountryModel> getCountryHolidaysFromCubit(String code, String yaer) {
    countryRepository
        .getCountryHolidaysFromRepository(yaer, code)
        .then((countries) {
      emit(CountryLoded(countries));
      this.countries = countries;
    });
    return countries;
  }

  List<CountriesCodeModel> getCountryCodeFromModelFromCubit() {
    countryRepository.getAllCountryCodeFromRepository().then((countriesCode) {
      emit(CountryCodeLoded(countriesCode));

      this.countriesCode = countriesCode;
    });
    return countriesCode;
  }

  setCodeValue(String code) {
    this.code = code;
    emit(SearchHolidaysLoded(this.code, year));
  }

  setYearValue(String year) {
    this.year = year;
    emit(SearchHolidaysLoded(code, this.year));
  }

  getList() {
    return getCountryHolidaysFromCubit(code, year);
  }

  getCodeVal() {
    return code;
  }

  getYaerVal() {
    return year;
  }
}
