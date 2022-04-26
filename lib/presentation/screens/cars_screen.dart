import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:interspark_test/bloc/cars_bloc.dart';
import 'package:interspark_test/presentation/screens/cars_detail_screen.dart';
import 'package:interspark_test/presentation/widgets/single_car.dart';
import 'package:interspark_test/utils/const.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars"),
      ),
      body: BlocBuilder<CarsBloc, CarsState>(builder: (context, state) {
        switch (state.carsStatus) {
          case FormzStatus.submissionSuccess:
            {
              return ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: (index == 0) ? 10 : 0,
                            bottom: 10,
                            left: 10,
                            right: 10),
                        child: SingleCar(
                          car: state.cars[index]
                              .copyWith(imgUrl: dummyImages[index]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarsDetailScreen(
                                        car: state.cars[index].copyWith(
                                            imgUrl: dummyImages[index]))));
                          },
                        ));
                  });
            }
          case FormzStatus.submissionInProgress:
            {
              return const Center(child: CircularProgressIndicator());
            }

          case FormzStatus.submissionFailure:
            {
              return Center(child: Text(state.errorMessage));
            }
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
