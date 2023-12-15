import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class HotelCubit extends Cubit<List<HotelModel>> {
  HotelCubit() : super(hotels);

  populaires(){
    emit(state.where((element) => element.prixMoyen<=6000).toList());
  }

}