import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class BookingCarCubit extends Cubit<BookCarModel> {
  BookingCarCubit() : super(initBookCar);

  setDate(DateTime start, DateTime end){
    state.start = start;
    state.end = end;
  }

  setMontant(double montant){
    state.montant =montant.toInt();
  }

  setCar(Car car){state.car = car;}
}