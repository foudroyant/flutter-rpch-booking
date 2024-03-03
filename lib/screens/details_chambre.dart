import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/models/avis.dart';
import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/models/reservation.dart';
import 'package:rpchbooking/providers/chambre.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/preview_book.dart';
import 'package:rpchbooking/utils/data.dart';
import 'package:rpchbooking/widgets/avis.dart';
import 'package:rpchbooking/widgets/card_chambre.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class DetailChambre extends StatefulWidget {
  const DetailChambre({Key? key, required this.chambre, required this.hotel}) : super(key: key);
  final ChambreModel chambre;
  final HotelModel hotel;

  @override
  State<DetailChambre> createState() => _DetailChambreState();
}

class _DetailChambreState extends State<DetailChambre> {
  List<DateTime?> _dates = [null, null];
  DateTime? startDate = null;
  DateTime? endDate = null;
  late List<AvisModel> _avis;
  late ReservationModel _reservation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _avis = avis;
    setState(() {
      _reservation = ReservationModel(
          chambre: {
            "id" : widget.chambre.id,
            "type" : widget.chambre.type,
            "image" : widget.chambre.images[0]
          },
          hotel: {
            "id" : widget.hotel.id,
            "hotel_nom" : widget.hotel.nom
          },
          user: {
            "uid" : FirebaseAuth.instance.currentUser?.uid,
            "email" : FirebaseAuth.instance.currentUser?.email,
            "photo" : FirebaseAuth.instance.currentUser?.photoURL,
            "name" : FirebaseAuth.instance.currentUser?.displayName,
          },
          taxe: 0,
          prix_unitaire: widget.chambre.prix
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de la chambre"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(onPressed: () async {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 30)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: endDate,
              startDate: startDate,
              backgroundColor: Colors.white,
              primaryColor: Theme.of(context).colorScheme.secondary,
              onApplyClick: (start, end) {
                setState(() {
                  endDate = end;
                  startDate = start;
                });
              },
              onCancelClick: () {
                setState(() {
                  endDate = null;
                  startDate = null;
                });
              },
            );

          }, icon: Icon(Icons.event))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0),
              items: widget.chambre.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                i
                                  //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/66191826.jpg?impolicy=resizecrop&rw=1200&ra=fit"
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),

            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.chambre.type, style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),),
                  Text("\$${widget.chambre.prix["usd"]}/nuit", style: TextStyle(
                    fontSize: 18,
                  ),)
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Capacité : ${widget.chambre.capacite.toInt()} Personnes", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade500
                  ),),
                ],
              ),
            ),

            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.fromLTRB(10,0,0,0),
              child: Text("Les service & équipements", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),),
            ),
            Column(
              children: widget.chambre.services_equipements.map((e){
                return Card(child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(e),
                ),);
              }).toList()
            ),

            /*SizedBox(height: 10.0),
            Text(
              'Avis et Commentaires',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: _avis.map((e) => CardAvis(avis: e,)).toList(),
            )*/
          ],
        ),
      ),
      bottomSheet:  Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        color: Colors.transparent,
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            if(startDate == null){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Vous devez d'abord choir une date de réservation"))
              );
            }else{
              _reservation.setDates([startDate, endDate]);
              _reservation.setMontant();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return  PreviewBook(reservation: _reservation);
                }),
              );
            }
          },
          child: Text("Aperçu"),
        ),
      ),
    );
  }
}
