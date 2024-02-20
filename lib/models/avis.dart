class AvisModel {
  String id;
  String user;
  String commentaire;
  double vote;

  AvisModel({
    this.id = "",
    this.user = "",
    this.commentaire = "",
    this.vote = 0
});

  Map toMap(){
    return {
      "id" : id,
      "user" : user,
      "commentaire" : commentaire,
      "vote" : vote
    };
  }
}