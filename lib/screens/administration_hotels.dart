import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/utils/data.dart';
import 'package:rpchbooking/widgets/card_hotel.dart';

import '../models/reservation.dart';

class AdminHotel extends StatefulWidget {
  const AdminHotel({Key? key}) : super(key: key);

  @override
  State<AdminHotel> createState() => _AdminHotelState();
}

class _AdminHotelState extends State<AdminHotel> {
  List<bool> visibility = [];
  List<HotelModel> _hotels = hotels;
  final db = FirebaseFirestore.instance;
  List<ReservationModel> reservations = [];

  String convertirDate(Timestamp time){
    return DateFormat("EEE, d MMM, ''yy").format(DateTime.fromMillisecondsSinceEpoch(
        time.seconds * 1000 + (time.nanoseconds / 1000000).round()));
  }

  getBooks(){
    db.collection("reservations").get().then(
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooks();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
          title: Text("Administration"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        bottom: TabBar(
          tabs: [
            Tab(text: 'Hotels'),
            Tab(text: 'En attente'),
            Tab(text: 'Confirmé'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          // Contenu de l'onglet 1
          ListView.builder(itemCount: _hotels.length, padding: EdgeInsets.all(16), itemBuilder: (context, index) {
            final _hotel = _hotels[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HotelListItem(_hotel),
                    /*visibility[index] ? FilledButton.icon(onPressed: (){
                      setState(() {
                        visibility[index] = false;
                      });
                    }, icon: Icon(Icons.visibility),
                    label: Text("l'hotel est visible")) : FilledButton.icon(onPressed: (){
                      setState(() {
                        visibility[index] = true;
                      });
                    }, label: Text("L'hotel est invisible"),
                    style: ButtonStyle(), icon: Icon(Icons.visibility_off),
                    )*/
                  ],
                ),
              ),
            );
          },),

          // Contenu de l'onglet 2
          ListView.builder(itemCount: reservations.where((element) => element.statut == "En attente").length, padding: EdgeInsets.all(16), itemBuilder: (context, index) {
            ReservationModel _book = reservations[index];
            return reservationEtat(true, _book);
          },),

          // Contenu de l'onglet 3
          ListView.builder(itemCount: reservations.where((element) => element.statut == "Confirmée").length, padding: EdgeInsets.all(16), itemBuilder: (context, index) {
            ReservationModel _book = reservations[index];
            return reservationEtat(false, _book);
          },),
        ],
      ),
    ),
    );
  }

  Widget reservationEtat(bool validate, ReservationModel book){
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.hotel["hotel_nom"], style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            Text(book.chambre["type"], style: TextStyle(
                fontSize: 14,
              color: Colors.grey.shade500
            ),),
            Row(
              children: [
                Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        book.chambre["image"]
                          //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/b460bc29.jpg?impolicy=resizecrop&rw=1200&ra=fit"
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.user["name"]),
                      Text(book.user["email"]),
                      Text(book.statut)
                    ],
                  ),
                )
              ],
            ),
            Text("${convertirDate(book.dates[0])} - ${convertirDate(book.dates[1])}"),
            Text('\$${book.montant["usd"].toString()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                validate ? IconButton(onPressed: (){}, icon: Icon(Icons.check)) : Container(),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red.shade500,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
