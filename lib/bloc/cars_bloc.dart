import 'package:bloc/bloc.dart';
import 'package:interspark_test/models/cars_model.dart';
import 'package:interspark_test/repositories/cars_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final AbstractCarsRepository carsRepo;

  CarsBloc({required this.carsRepo})
      : super(const CarsState(
            carsStatus: FormzStatus.pure, cars: [], errorMessage: "")) {
    on<FetchCars>(fetchAllCars);
  }

  Future<void> fetchAllCars(CarsEvent event, Emitter<CarsState> emit) async {
    try {
      emit(state.copyWith(
          cars: [],
          carsStatus: FormzStatus.submissionInProgress,
          errorMessage: ""));

      List<Car> cars = await carsRepo.getAllCars();

      _sortCar(cars);
      emit(state.copyWith(
          cars: cars,
          carsStatus: FormzStatus.submissionSuccess,
          errorMessage: ""));
    } catch (e) {
      print(e);
      emit(state.copyWith(
          carsStatus: FormzStatus.submissionFailure,
          cars: [],
          errorMessage: e.toString()));
    }
  }

  void _sortCar(List<Car> cars){
    cars.sort((a, b){ //sorting in ascending order
      return a.name.compareTo(b.name);
    });
  }
}
