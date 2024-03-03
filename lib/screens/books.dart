import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:rpchbooking/models/reservation.dart';
import 'package:rpchbooking/screens/payement.dart';
import 'package:rpchbooking/screens/paypal.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final db = FirebaseFirestore.instance;
  List<ReservationModel> reservations = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.collection("reservations").where("user.uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid).get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          print(docSnapshot.data());
          final _book = ReservationModel(
            user: {
              "uid" : docSnapshot.data()["user"]["uid"],
              "email" : docSnapshot.data()["user"]["email"],
              "photo" : docSnapshot.data()["user"]["photo"],
              "name" : docSnapshot.data()["user"]["name"]
            },
            chambre: {
              "id" : docSnapshot.data()["chambre"]["id"],
              "type" : docSnapshot.data()["chambre"]["type"],
              "image" : docSnapshot.data()["chambre"]["image"]
            },
            prix_unitaire: docSnapshot.data()["prix_unitaire"],
            taxe: docSnapshot.data()["taxe"],
            id: docSnapshot.id,
            dates: docSnapshot.data()["dates"],
            hotel: {
              "id" : docSnapshot.data()["hotel"]["id"],
              "hotel_nom" : docSnapshot.data()["hotel"]["hotel_nom"]
            },
            jours: docSnapshot.data()["jours"],
            montant: docSnapshot.data()["montant"],
            statut: docSnapshot.data()["statut"],
          );

          setState(() {
            reservations.add(_book);
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
  
  String convertirDate(Timestamp time){
    return DateFormat("EEE, d MMM, ''yy").format(DateTime.fromMillisecondsSinceEpoch(
        time.seconds * 1000 + (time.nanoseconds / 1000000).round()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historiques"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer
      ),
      body: ListView.builder(itemCount: reservations.length,padding: EdgeInsets.all(10), itemBuilder: (context, index) {
        final ReservationModel _book = reservations[index];
        print(_book.dates[0]);
        return reservations.length==0 ? Center(
          child: Text("Pas de réservations pour l'instant..."),
        ) : Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Détails de payement", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                    fontSize: 18
                )),
                laLigne("ID", _book.id),
                laLigne("Date", '${convertirDate(_book.dates[0])} - ${convertirDate(_book.dates[1])}'),
                laLigne("Montant", "\$${_book.montant['usd']}"),
                laLigne("Hotel", _book.hotel["hotel_nom"]),
                laLigne("Chambre", _book.chambre['type']),
                laLigne("Statut", _book.statut),
                Divider(),
                Text("Répartition des transactions", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16
                )),
                laLigne("Hors taxe", "\$"+_book.montant['usd'].toString()),
                laLigne("Taxe", "\$${_book.taxe}"),
                laLigne("Total", "\$${_book.montant['usd'] + _book.taxe}"),
                Divider(),
                /*Container(
                  width: double.infinity,
                  child: FilledButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>PaypalPay()),
                    );
                  }, child: Text("Payer")),
                )*/
                Column(
                  children: [
                    Text("https://rpch-payement.netlify.app/?reservation=reservations/${_book.id}", style: TextStyle(
                      overflow: TextOverflow.ellipsis
                    ),),
                    Row(
                      children: [
                        Text("Copier le lien de payement"),
                        IconButton(onPressed: (){
                          Clipboard.setData(ClipboardData(text: "https://rpch-payement.netlify.app/?reservation=reservations/${_book.id}"));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Le lien a été copié dans le presse-papiers. Collez cela dans un navigateur.'),
                            ),
                          );
                        }, icon: Icon(Icons.copy))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },),
    );
  }

  Widget laLigne(String titre, String valeur){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titre, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),),
        Text(valeur, style: TextStyle(
          fontSize: 13,
          color: valeur=="En attente" ? Colors.red : (valeur ==  "Confirmée"? Colors.green : Colors.black),
        ),)
      ],
    );
  }
}
