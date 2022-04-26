part of 'cars_bloc.dart';


class CarsState extends Equatable {
  final FormzStatus carsStatus;
  final List<Car> cars;
  final String errorMessage;
  const CarsState({required this.carsStatus, required this.cars, required this.errorMessage});

  @override
  List<Object?> get props => [
    carsStatus,
    cars,
    errorMessage
  ];

  CarsState copyWith({
    FormzStatus? carsStatus,
    List<Car>? cars,
    String? errorMessage,
  }) {
    return CarsState(
      carsStatus: carsStatus ?? this.carsStatus,
      cars: cars ?? this.cars,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
