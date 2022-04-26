import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interspark_test/bloc/cars_bloc.dart';
import 'package:interspark_test/presentation/screens/cars_screen.dart';
import 'package:interspark_test/repositories/cars_repository.dart';
import 'api/cars_api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => CarsRepository(carsApiClient: CarsApiClient()),
        child: BlocProvider(
            create: (context) =>
                CarsBloc(carsRepo: context.read<CarsRepository>())..add(FetchCars()),
            child: const CarsScreen()),
      ),
    );
  }
}
