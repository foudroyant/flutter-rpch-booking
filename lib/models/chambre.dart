class ChambreModel {
  String id;
  String type;
  String description;
  Map prix;
  int capacite;
  List services_equipements;
  List images;

  ChambreModel({
    this.id = "",
    this.type ="",
    this.description ="",
    this.prix =const {},
    this.capacite = 0,
    this.images = const [],
    this.services_equipements = const[]
  });

  toMap(){
    return {
      "id" :id,
      "type" : type,
      "description" : description,
      "prix" : prix,
      "capacite" : capacite,
      "services_equipements" : services_equipements,
      "images" : images
    };
  }
}