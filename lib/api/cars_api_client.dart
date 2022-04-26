
import 'package:dio/dio.dart';

import 'api_config.dart';

class CarsApiClient extends ApiConfig {
  Future<Response> getAllCars() async {
    try {
      Response response = await dio.get(dio.options.baseUrl + "/vehicle/list");
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
