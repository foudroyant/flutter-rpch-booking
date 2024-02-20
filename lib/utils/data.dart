import '../models/avis.dart';
import '../models/chambre.dart';
import '../models/hotel.dart';

List<HotelModel> hotels = [
  /*HotelModel(
      id : "Bla bla bla",
      nom: "Atlantic Palace",
      description : "Une description pour Atlantic Palace",
      localisation : "Pointe noire",
      prix : {
        "usd" : 20,
        "xaf" : 12000,
        "eur" : 17
      },
      images : ["assets/images/hotel.jpg", "assets/images/hotel3.jpg", "assets/images/hotel.jpg"],
      services_equipements : ["Parking gratuit", "Wify", "Netoyage"]
  ),
  HotelModel(
      id : "Bla bla bla",
      nom : "El Maestro",
      description : "Une description pour El Maestro",
      localisation : "Pointe noire",
      prix : {
        "usd" : 10,
        "xaf" : 6000,
        "eur" : 9
      },
      images : ["assets/images/hotel.jpg", "assets/images/hotel.jpg", "assets/images/hotel.jpg"],
      services_equipements : ["Parking gratuit", "Wify", "Netoyage"]
  ),
  HotelModel(
      id : "Bla bla bla",
      nom : "Radison",
      description : "Une description pour Radison",
      localisation : "Brazzaville",
      prix : {
        "usd" : 30,
        "xaf" : 20000,
        "eur" : 25
      },
      images : ["assets/images/hotel.jpg", "assets/images/hotel.jpg", "assets/images/hotel.jpg"],
      services_equipements : ["Parking gratuit", "Wify", "Netoyage"]
  )*/
];

List<ChambreModel> chambres = [
  /*ChambreModel(
    id: "id de la chambre",
    services_equipements: ["Wify", "Netoyage",],
    description: "Description de la chambre",
    prix: {
      "usd" : 10,
      "xaf" : 6000,
      "eur" : 9
    },
    capacite: 3,
    images: ["assets/images/chambre2.jpg", "assets/images/chambre2.jpg"],
    type: "Suite simple",
  ),
  ChambreModel(
    id: "id de la chambre",
    services_equipements: ["Wify", "Netoyage",],
    description: "Description de la chambre",
    prix: {
      "usd" : 10,
      "xaf" : 6000,
      "eur" : 9
    },
    capacite: 3,
    images: ["assets/images/chambre1.jpg", "assets/images/chambre2.jpg"],
    type: "Suite standard",
  ),
  ChambreModel(
    id: "id de la chambre",
    services_equipements: ["Wify", "Netoyage",],
    description: "Description de la chambre",
    prix: {
      "usd" : 15,
      "xaf" : 9000,
      "eur" : 12
    },
    capacite: 2,
    images: ["assets/images/hotel.jpg", "assets/images/chambre2.jpg"],
    type: "Suite moderne",
  ),*/
];

List<AvisModel> avis = [
  AvisModel(
    id : "id de l'avis",
    commentaire: "Un super commentaire pour la chambre, je valide. Et si mon commentaire était long?",
    user: "Bamby Stéphane",
    vote: 3,
  ),
  AvisModel(
    id : "id de l'avis",
    commentaire: "Le toit de la chambre une fuite.",
    user: "Bamby Vénus",
    vote: 3,
  ),
  AvisModel(
    id : "id de l'avis",
    commentaire: "Je récommande cet hotel.",
    user: "Bamby Van",
    vote: 3,
  )
];