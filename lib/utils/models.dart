import 'dart:ffi';

class HotelModel {
  final int id;
  final String nom;
  final String localisation;
  final String description;
  final String image;
  final List images;
  final int prixMoyen;
  final List services;
  final List equipements;

  HotelModel(this.id, this.nom, this.localisation, this.description, this.image, this.images, this.prixMoyen, this.services, this.equipements);
}

class ChambreModel {
  final int id;
  final int hotel;
  final String type;
  final int prix;
  final String image;
  final List images;
  final bool disponible;
  final int capacite;
  final List equipements;

  ChambreModel(this.id, this.hotel, this.type, this.prix, this.image, this.images, this.disponible, this.capacite, this.equipements);
}


class BookHotelModel {
  final int id;
  late int hotel;
  late int chambre;
  late DateTime start;
  late DateTime end;
  late String statut; // (confirmée, en attente, annulée, etc.)
  late int montantTotal;
  late String infoPayement;
  late int profil;

  setDate(DateTime start, DateTime end){
    this.start = start;
    this.end = end;
  }

  BookHotelModel(this.id, this.hotel, this.chambre, this.start, this.end, this.statut, this.montantTotal, this.infoPayement, this.profil);
}

class ProfilModel {
  final int id;
  final String nomPremon;
  final String email;
  final String telephone;
  final String photo;

  ProfilModel(this.id, this.nomPremon, this.email, this.telephone, this.photo);
}

class Entity {
  final int id;
  final int prix;
  final String localisation;
  final List<String> images;
  final String telephone;
  final String label;
  final String quartier;
  final String description;

  Entity(this.id, this.prix, this.localisation, this.images, this.telephone, this.label, this.quartier, this.description);
}

class Maison extends Entity {

  Maison(super.id, super.prix, super.localisation, super.images, super.telephone, super.label, super.quartier, super.description);
}

class Evenement extends Entity {
  final List<Map> invites;
  final Map hote;
  final DateTime start;
  final DateTime end;
  Evenement(super.id, super.prix, super.localisation, super.images, super.telephone, super.label, super.quartier, super.description, this.invites, this.hote, this.start, this.end);
}

class Car {
  String marque;
  String modele;
  int annee;
  String couleur;
  double prix;
  bool disponible;
  String localite;
  String quartier;
  String image;

  Car({
    required this.marque,
    required this.modele,
    required this.annee,
    required this.couleur,
    required this.prix,
    required this.disponible,
    required this.localite,
    required this.quartier,
    required this.image,
  });
}

class BookCarModel {
  int id;
  Car car;
  DateTime start;
  DateTime end;
  int montant;

  BookCarModel({
    required this.id,
    required this.car,
    required this.start,
    required this.end,
    required this.montant,
});
}
