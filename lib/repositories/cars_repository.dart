import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:interspark_test/models/cars_model.dart';

import '../api/cars_api_client.dart';


abstract class AbstractCarsRepository {
  Future<List<Car>> getAllCars();
  Future<void> saveToLocal(List<Car> cars);
}

class CarsRepository extends AbstractCarsRepository {
  final CarsApiClient carsApiClient;

  CarsRepository({required this.carsApiClient});
  @override
  Future<List<Car>> getAllCars() async {
    final Response response = await carsApiClient.getAllCars();

    final responseJson = jsonDecode(response.data);

    return List.from(responseJson["vehicleList"]).map((e) {
      return Car.fromJson(e);
    }).toList();
  }

  @override
  Future<void> saveToLocal(List<Car> cars) {
    // TODO: implement saveToLocal
    throw UnimplementedError();
  }
}
