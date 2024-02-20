import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/utils/data.dart';
import 'package:rpchbooking/widgets/card_hotel.dart';

class AdminHotel extends StatefulWidget {
  const AdminHotel({Key? key}) : super(key: key);

  @override
  State<AdminHotel> createState() => _AdminHotelState();
}

class _AdminHotelState extends State<AdminHotel> {
  List<bool> visibility = [];
  List<HotelModel> _hotels = hotels;
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
                    visibility[index] ? FilledButton.icon(onPressed: (){
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
                    )
                  ],
                ),
              ),
            );
          },),

          // Contenu de l'onglet 2
          ListView.builder(itemCount: 5, padding: EdgeInsets.all(16), itemBuilder: (context, index) {
            return reservationEtat(true);
          },),

          // Contenu de l'onglet 3
          ListView.builder(itemCount: 3, padding: EdgeInsets.all(16), itemBuilder: (context, index) {
            return reservationEtat(false);
          },),
        ],
      ),
    ),
    );
  }

  Widget reservationEtat(bool validate){
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hotel", style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            Text("Chambre", style: TextStyle(
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
                      image: AssetImage(
                        "assets/images/hotel.jpg"
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
                      Text("Nom & Prénom"),
                      Text("Email"),
                      Text("En attente")
                    ],
                  ),
                )
              ],
            ),
            Text("Dates de sejour"),
            Text("Prix"),
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
