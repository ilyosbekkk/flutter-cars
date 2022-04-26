import 'package:flutter/material.dart';
import 'package:interspark_test/models/cars_model.dart';

class SingleCar extends StatelessWidget {
  const SingleCar({Key? key, required this.car,  required this.onTap}) : super(key: key);

  final Car car;
  final Function() onTap;
  static const imageHeight = 90.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: imageHeight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(car.imgUrl))),
            const SizedBox(
              height: 10,
            ),
            Text("name: ${car.name}")
          ],
        ),
      ),
    );
  }
}
