class User {
  String id;
  String email;
  String name;
  String photo;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.photo
});

  Map toMap(){
    return {
      "id" : id,
      "email" : email,
      "name" : name,
      "photo" : photo
    };
  }
}