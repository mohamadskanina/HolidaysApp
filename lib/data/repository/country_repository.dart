import 'package:myapp/data/models/countrymodel.dart';
import 'package:myapp/data/web_services/country_web_services.dart';

class CountryRepository {
  late CountryWebServices countryWebServices;
  CountryRepository(this.countryWebServices);

  Future<List<CountryModel>> getAllCountry() async {
    final country = await countryWebServices.getAllCountry();
    return country.map((e) => CountryModel.fromJson(e)).toList();
  }
}
