import 'package:flutter/cupertino.dart';
import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/reservation.dart';

import '../models/hotel.dart';

class ReservationProvider extends ChangeNotifier {
  late Map data;

  ReservationProvider({
    this.data = const {}
});

  setData(Map newData){
    data = newData;
    notifyListeners();
  }

  Map toMap(){
    return data;
  }


}