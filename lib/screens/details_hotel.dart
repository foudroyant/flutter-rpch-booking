import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/details_chambre.dart';
import 'package:rpchbooking/utils/data.dart';
import 'package:rpchbooking/widgets/card_chambre.dart';

import '../providers/chambre.dart';

class DetailHotel extends StatefulWidget {
  const DetailHotel({Key? key, required this.hotel}) : super(key: key);
  final HotelModel hotel;

  @override
  State<DetailHotel> createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  final db = FirebaseFirestore.instance;
  List<ChambreModel> _chambres = chambres;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.collection("hotels").doc(widget.hotel.id).collection("chambres").get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          final _chambre = ChambreModel(
            id: docSnapshot.id,
            services_equipements: docSnapshot.data()["services_equipements"],
            description: docSnapshot.data()["description"],
            prix: docSnapshot.data()["prix"],
            images: docSnapshot.data()["images"],
            type: docSnapshot.data()["type"],
            capacite: docSnapshot.data()["capacite"],
          );
          setState(() {
            _chambres.add(_chambre);
          });
          //print(docSnapshot.data());
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de l'hotel"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0),
              items: widget.hotel.images.map((i) {
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
              title: Text(widget.hotel.nom, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.hotel.localisation, style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade500
                  ),),
                  Text(widget.hotel.description, style: TextStyle(
                      fontSize: 14,
                  ),)
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
              children: widget.hotel.services_equipements.map((e){
                return Card(child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(e),
                ),);
              }).toList()
            ),

            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.fromLTRB(16,0,0,0),
              child: Text("Les chambres", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _chambres.length,
                itemBuilder: (context, index) {
                  final ChambreModel _chambre = _chambres[index];
                  //print(_chambre.toMap());
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: ChambreCard(_chambre),
                      onTap: (){
                        context.read<HotelProvider>().updateHotel(newHotel: widget.hotel);
                        context.read<ChambreProvider>().updateChambre(newChambre: _chambre);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailChambre(chambre: _chambre, hotel: widget.hotel,)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
