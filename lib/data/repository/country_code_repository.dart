import 'package:myapp/core/database/database.dart';
import 'package:myapp/data/models/countrycodemodel.dart';
import 'package:myapp/data/models/countrymodel.dart';
import 'package:myapp/data/web_services/country_code_services.dart';

class CountryCodeRepository {
  SqlDb sqlDb = SqlDb();
  late CountryCodeServices countryWebServices;
  CountryCodeRepository(this.countryWebServices);

  Future<List<CountriesCodeModel>> getAllCountryCodeFromRepository() async {
    List<dynamic> listOfCountryCodeModel =
        await sqlDb.readData("SELECT * FROM ${SqlDb.countryTable}");
    if (listOfCountryCodeModel.isEmpty) {
      final country = await countryWebServices.getAllCountryCodeFromApi();
      if (country.isNotEmpty) {
        for (var i = 0; i < country.length; i++) {
          String qwery =
              '''INSERT INTO ${SqlDb.countryTable} (${SqlDb.countryName}, ${SqlDb.countryShortName}) VALUES ("${country[i][SqlDb.countryName]}","${country[i][SqlDb.countryShortName]}")''';
          await sqlDb.insertData(qwery);
        }
      }
      listOfCountryCodeModel =
          await sqlDb.readData("SELECT * FROM ${SqlDb.countryTable}");
    }
    return listOfCountryCodeModel
        .map((e) => CountriesCodeModel.fromJson(e))
        .toList();
  }

  Future<List<CountryModel>> getCountryHolidaysFromRepository(
      String year, String code) async {
    List<dynamic> country =
        await countryWebServices.getCountryHolidaysFromApi(year, code);
    return country.map((e) => CountryModel.fromJson(e)).toList();
  }
}
