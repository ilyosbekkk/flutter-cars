part of 'cars_bloc.dart';

@immutable
abstract class CarsEvent extends Equatable {}

class FetchCars extends CarsEvent {
  @override
  List<Object?> get props => [];
}

