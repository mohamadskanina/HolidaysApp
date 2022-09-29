import 'package:dio/dio.dart';
import 'package:myapp/core/constant/linkapi.dart';

class CountryCodeServices {
  late Dio dio;
  CountryCodeServices() {
    BaseOptions baseOptions = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      sendTimeout: 20 * 1000,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJtb2hhbWFka2FuaW5hOUBnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiJIVjRaQS1TME1aT2lzODU0ajZzQ2ZaRURpTjZCR3dZWmRBRDI2U1RLNUFiWC1nQ00wVXZyMmlPbUdxSFRzZERYclV3In0sImV4cCI6MTY2NDQ3MTk2OX0.04Y0Et9DxOdSL1nePpzVua_KqcWxcQa45v_Hk3p1ImI",
        "Accept": "application/json",
      },
    );
    dio = Dio(baseOptions);
  }
  Future<List<dynamic>> getAllCountryCodeFromApi() async {
    try {
      Response response = await dio.get(AppLink.countriesCodeLink);
      return response.data;
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getCountryHolidaysFromApi(
      String year, String code) async {
    try {
      Response response =
          await dio.get("${AppLink.countriesHolidaysLink}/$year/$code");
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
