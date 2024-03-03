import 'package:flutter/cupertino.dart';
import 'package:rpchbooking/models/hotel.dart';

class HotelProvider extends ChangeNotifier {
  late HotelModel hotel;


  void updateHotel({
    required HotelModel newHotel
}){
    this.hotel = newHotel;
    notifyListeners();
  }
}