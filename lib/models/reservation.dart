import 'dart:core';
import 'dart:core';

import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/hotel.dart';

import '../providers/chambre.dart';


class ReservationModel {
  late String id;
  late List dates;
  late int jours;
  late Map montant;
  late Map chambre;
  late String statut;
  late double taxe = 0;
  late Map hotel;
  late Map prix_unitaire;
  late Map user ;

  setDates(List<DateTime?> newDates){
    dates = newDates;
    jours = newDates[1]!.difference(newDates[0]!).inDays;
  }

  setMontant(){
    montant = {
      "usd" : prix_unitaire["usd"] * dates[1]!.difference(dates[0]!).inDays,
      "eur" : prix_unitaire["eur"] * dates[1]!.difference(dates[0]!).inDays,
      "xaf" : prix_unitaire["xaf"] * dates[1]!.difference(dates[0]!).inDays
    };
  }

  setHotel(HotelModel newHotel){
    hotel = {
      "id" : newHotel.id,
      "nom" : newHotel.nom,
    };
  }

  ReservationModel({
    this.id="",
    this.dates = const [null, null],
    this.jours = 0,
    this.montant = const {},
    this.statut = "En attente",
    required this.chambre,
    this.hotel = const {},
    required this.user,
    required this.taxe,
    required this.prix_unitaire,
  });

  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "dates" : dates,
      "jours" : jours,
      "montant" : montant,
      "statut" : statut,
      "chambre"  : chambre,
      "hotel" : hotel,
      "user" : user,
      "taxe" : taxe,
      "prix_unitaire" : prix_unitaire
    };
  }
}