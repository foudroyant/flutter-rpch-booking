import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:rpchbooking/models/chambre.dart';

import '../models/hotel.dart';

class ReservationProvider extends ChangeNotifier {
  late String id ="";
  late List<DateTime> dates;
  late int jours;
  late double montant;
  late ChambreModel chambre;
  String statut = "En attente";
  late double taxe = 0;
  late HotelModel hotel;
  late Map prix_unitaire;

  Map toMap(){
    return {
      "id" : id,
      "dates" : dates,
      "montant" : chambre.prix['usd'] * jours,
      "taxe" : taxe,
      "statut" : statut,
      "hotel_id" : hotel.id,
      "hotel_nom" : hotel.id,
      "chambre_id" : chambre.id,
      "chambre_type" : chambre.type,
      "chambre_img" : chambre.images[0],
      "prix_unitaire" : chambre.prix,
      "jours" : jours
    };
  }

  void setId(String newId){
    id = newId;
    notifyListeners();
  }

  void setDates(List<DateTime> newDates){
    dates = newDates;
    jours = newDates[1]!.difference(newDates[0]!).inDays;
    notifyListeners();
  }

  void setMontant(double newMontant, double newTaxe){
    montant = newMontant;
    taxe = newTaxe;
    notifyListeners();
  }

  void setHotel(HotelModel newHotel){
    hotel = newHotel;
    notifyListeners();
  }

  void setChambre(ChambreModel newChambre){
    chambre = newChambre;
    notifyListeners();
  }

  void setStatut(String newStatut){
    statut = newStatut;
    notifyListeners();
  }

}