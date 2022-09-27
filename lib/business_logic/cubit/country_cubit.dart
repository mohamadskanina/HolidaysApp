import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/models/countrymodel.dart';
import 'package:myapp/data/repository/country_repository.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepository countryRepository;
  List<CountryModel> countries = [];
  CountryCubit(this.countryRepository) : super(CountryInitial());

  List<CountryModel> getCountryFromModel() {
    countryRepository.getAllCountry().then((countries) {
      emit(CountryLoded(countries));
      this.countries = countries;
    });
    return countries;
  }
}
