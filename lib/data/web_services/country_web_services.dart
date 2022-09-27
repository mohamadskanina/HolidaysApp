import 'package:dio/dio.dart';
import 'package:myapp/core/constant/linkapi.dart';

class CountryWebServices {
  late Dio dio;

  CountryWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppLink.server,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      sendTimeout: 20 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCountry() async {
    try {
      Response response = await dio.get("2021/us");

      return response.data;
    } catch (e) {
      return [];
    }
  }
}
