import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/models/reservation.dart';
import 'package:rpchbooking/models/user.dart';
import 'package:rpchbooking/providers/chambre.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/books.dart';

class PreviewBook extends StatefulWidget {
  const PreviewBook({Key? key, required this.reservation}) : super(key: key);
  final ReservationModel reservation;

  @override
  State<PreviewBook> createState() => _PreviewBookState();
}

class _PreviewBookState extends State<PreviewBook> {

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Aperçu de la réservation"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.reservation.chambre["image"]
                        //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/66191826.jpg?impolicy=resizecrop&rw=1200&ra=fit"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            //_buildInfoReservation('Nom de l\'hôtel', widget.reservation.hotel["nom"]),
            _buildInfoReservation('Chambre', widget.reservation.chambre["type"]),
            _buildInfoReservation('Dates', widget.reservation.dates.join(" - ")),
            _buildInfoReservation('Nombre de jours', widget.reservation.jours.toString()),
            _buildInfoReservation('Prix par nuit', '\$${widget.reservation.prix_unitaire['usd']}'),
            _buildInfoReservation('Prix total', '\$${widget.reservation.montant["usd"]}'),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Colors.white70,
        ),
        child: FilledButton.icon(
          onPressed: (){
            final Map<String, dynamic> book = widget.reservation.toMap();
            book.remove("id");
            print(book);
            db.collection("reservations").add(book).then((documentSnapshot){
              print("Added Data with ID: ${documentSnapshot.id}");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Books()),
              );
            });
          }, icon: Icon(Icons.book), label: Text("Réserver Maintenant"),
          style: const ButtonStyle(
          ),
        ),
      ),
    );
  }

  Widget _buildInfoReservation(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),),
        subtitle: Text(value, style: TextStyle(
          fontSize: 14,
        ),),
      ),
    );
  }
}
