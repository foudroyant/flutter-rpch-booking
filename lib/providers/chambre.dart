import 'package:flutter/cupertino.dart';
import 'package:rpchbooking/models/chambre.dart';

class ChambreProvider extends ChangeNotifier {
  late ChambreModel chambre;

  void updateChambre({
    required ChambreModel newChambre,
  }){
    chambre = newChambre;
    notifyListeners();
  }
}