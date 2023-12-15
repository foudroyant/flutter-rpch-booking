import 'package:rpch/utils/models.dart';

final List<HotelModel> hotels = [
  HotelModel(1, "Doubletree", "Pointe noire",
      "L’établissement Doubletree By Hilton Pointe-Noire City Centre se situe à Pointe-Noire, à 23 km de ce lieu d’intérêt : Diosso Golf Course.",
      "",
      ["","","",""],
      5000,
      ["Repas", "Parking"],
      ["Wifi", "Canal Sat"]
  ),

  HotelModel(2, "El Rio", "Pointe noire", "Centre ville vers City Sport", "",["","",""], 6000, ["Repas", "Parking"], ["Wifi", "Canal Sat"]),
  HotelModel(3, "El Maestro", "Pointe noire", "Songolo", "",["",""], 5000, ["Repas", "Parking, Navette gratuite"], ["Wifi", "Canal Sat"]),
  HotelModel(4, "Pandore", "Brazzaville", "Centre ville vers la Mandarine", "",["","",""], 10000, ["Repas", "Parking, Service en chambre"], ["Wifi", "Canal Sat"]),
  HotelModel(5, "Mbalé", "Ouesso", "vers Péké", "",["",""], 6500, ["Repas", "Parking"], ["Wifi", "Canal Sat"]),
];

final chambres = [
  ChambreModel(1, 1, "Simple", 5000, "", ["", "", ""], true, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(2, 1, "Simple", 5000, "", ["", "", ""], false, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(3, 2, "Simple", 5000, "", ["", "", ""], true, 2, ["Wifi", "Canal Sat"]),
  ChambreModel(4, 2, "Simple", 5000, "", ["", "", ""], true, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(5, 3, "Simple", 5000, "", ["", "", ""], false, 2, ["Wifi", "Canal Sat"]),
  ChambreModel(6, 3, "Simple", 5000, "", ["", "", ""], false, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(7, 4, "Simple", 5000, "", ["", "", ""], false, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(8, 4, "Simple", 5000, "", ["", "", ""], true, 3, ["Wifi", "Canal Sat"]),
  ChambreModel(9, 5, "Simple", 10000, "", ["", "", ""], false, 4, ["Wifi", "Canal Sat"]),
  ChambreModel(10, 5, "Climatisé", 6000, "", ["", "", ""], true, 1, ["Wifi", "Canal Sat"]),
  ChambreModel(11, 1, "Simple", 5000, "", ["", "", ""], true, 3, ["Wifi", "Canal Sat"]),
];


final List<Maison> maisons = [
  Maison(1,
      25000, "Brazzaville", ["", "", ""],
          "+242 05 987 45 63",
      "Studio", "Itoumbi", "Studio moderne avec toilette moderne"
  ),
  Maison(2,
      8000, "Ouesso", ["", "", "", ""],
      "+242 05 987 45 63",
      "Studio", "Ngongo", "Studio moderne avec toilette semi-moderne"
  ),
  Maison(3,
      50000, "Brazzaville", ["", "", ""],
      "+242 05 987 45 63",
      "2 chambres-salon", "Plateau des 15 ans", "Deux chambres/Salon avec plafond et carreau. Il y'a aussi une pompe à eau dans la parcelle."
  ),
  Maison(4,
      30000, "Pointe-Noire", ["", ""],
      "+242 05 987 45 63",
      "Studio", "Mongo-Kamba", "Studio moderne avec toilette moderne"
  ),
  Maison(5,
      15000, "Dolisie", ["", "", ""],
      "+242 05 987 45 63",
      "Studio", "Capable", "Studio moderne avec toilette moderne"
  ),
];


final List<Evenement> evenements = [
  Evenement(1, 25000, "Brazzaville",
    ["", "", ""],
    "+242053128547", "La crypto-monnaie",
    "Ouenzé",
    "Découverte de la crypto-monnaie",
    [
      {"nom" :"Béranger Louvikou", "image":"", "details":"Marchant Binance en Africaine"},
      {"nom": "Stéphane Bamby", "image":"", "details":"Développeur FullStack Web et Mobile"}
    ],
    {
      "nom":"Alex Biouka", "details":"Peintre", "image":""
    }, DateTime.now(), DateTime.now()
  ),
];

List<Car> listeVoitures = [
  Car(
    marque: 'Toyota',
    modele: 'Corolla',
    annee: 2022,
    couleur: 'Bleu',
    prix: 50.0,
    disponible: true,
    localite: 'Ville A',
    quartier: 'Centre-ville',
    image: "chambre.jpg"
  ),
  Car(
    marque: 'Honda',
    modele: 'Civic',
    annee: 2021,
    couleur: 'Rouge',
    prix: 45.0,
    disponible: true,
    localite: 'Ville B',
    quartier: 'Quartier Est',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Ford',
    modele: 'Focus',
    annee: 2020,
    couleur: 'Noir',
    prix: 40.0,
    disponible: false,
    localite: 'Ville C',
    quartier: 'Quartier Ouest',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Chevrolet',
    modele: 'Malibu',
    annee: 2023,
    couleur: 'Argent',
    prix: 55.0,
    disponible: true,
    localite: 'Ville A',
    quartier: 'Quartier Nord',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Nissan',
    modele: 'Altima',
    annee: 2022,
    couleur: 'Blanc',
    prix: 48.0,
    disponible: false,
    localite: 'Ville B',
    quartier: 'Quartier Sud',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Hyundai',
    modele: 'Elantra',
    annee: 2021,
    couleur: 'Vert',
    prix: 42.0,
    disponible: true,
    localite: 'Ville C',
    quartier: 'Centre-ville',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Volkswagen',
    modele: 'Jetta',
    annee: 2020,
    couleur: 'Gris',
    prix: 38.0,
    disponible: true,
    localite: 'Ville A',
    quartier: 'Quartier Est',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Mazda',
    modele: 'Mazda3',
    annee: 2023,
    couleur: 'Jaune',
    prix: 52.0,
    disponible: false,
    localite: 'Ville B',
    quartier: 'Quartier Ouest',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Kia',
    modele: 'Forte',
    annee: 2022,
    couleur: 'Orange',
    prix: 47.0,
    disponible: true,
    localite: 'Ville C',
    quartier: 'Quartier Nord',
      image: "chambre.jpg"
  ),
  Car(
    marque: 'Subaru',
    modele: 'Impreza',
    annee: 2021,
    couleur: 'Marron',
    prix: 43.0,
    disponible: false,
    localite: 'Ville A',
    quartier: 'Quartier Sud',
      image: "chambre.jpg"
  ),
];

BookHotelModel initBookHotel = BookHotelModel(
    0, 1, 2, new DateTime.now(), new DateTime.now(), "en attente", 0, "Payement", 1
);

BookCarModel initBookCar = BookCarModel(id: 0, car: listeVoitures[1], start: DateTime.now(), end: DateTime.now(), montant: 0);