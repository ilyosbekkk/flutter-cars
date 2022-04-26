import 'package:flutter/material.dart';
import 'package:interspark_test/models/cars_model.dart';

class CarsDetailScreen extends StatelessWidget {
  const CarsDetailScreen({Key? key, required this.car}) : super(key: key);

  final Car car;
  static const imgHeight = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed Info"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: imgHeight,
            child: Image.network(car.imgUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          const Text("Car Info:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _carInfo("name", car.name),
          const SizedBox(height: 10),
          _carInfo("model", car.model),
          const SizedBox(height: 10),
          _carInfo("age", car.age.toString()),
        ],
      ),
    );
  }

  Widget _carInfo(String type, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text("$type:", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Text(content),
        ],
      ),
    );
  }
}
