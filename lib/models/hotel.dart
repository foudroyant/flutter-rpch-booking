class HotelModel {
  String id;
  String nom;
  String description;
  String localisation;
  Map prix;
  List services_equipements;
  List images;
  bool visible = true;

  HotelModel({
    this.id = "",
    this.nom ="",
    this.description ="",
    this.localisation ="",
    this.prix =const {},
    this.images = const [],
    this.services_equipements = const[]
  });

  toMap(){
    return {
      "id" : id,
      "nom" : nom,
      "description" : description,
      "localisation" : localisation,
      "prix" : prix,
      "services_equipements" : services_equipements,
      "images" : images,
      "visible" : visible
    };
  }
}
