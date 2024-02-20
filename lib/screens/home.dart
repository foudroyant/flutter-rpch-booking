import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/administration_hotels.dart';
import 'package:rpchbooking/screens/books.dart';
import 'package:rpchbooking/screens/details_hotel.dart';
import 'package:rpchbooking/screens/terms_conditions.dart';
import 'package:rpchbooking/widgets/card_hotel.dart';

import '../utils/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final db = FirebaseFirestore.instance;
  List<HotelModel> _hotels = hotels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.collection("hotels").get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          final _hotel = HotelModel(
            id: docSnapshot.id,
            images: docSnapshot.data()["images"],
            prix: docSnapshot.data()['prix'],
            description: docSnapshot.data()["description"],
            services_equipements: docSnapshot.data()["services_equipements"],
            nom: docSnapshot.data()["nom"],
            localisation: docSnapshot.data()["localisation"],
          );
          setState(() {
            _hotels.add(_hotel);
          });
          print(docSnapshot.data());
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Ajoutez une clé au Scaffold
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        leading: IconButton(onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        }, icon: Icon(Icons.menu),),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/hotel.jpg"
                      //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/66191826.jpg?impolicy=resizecrop&rw=1200&ra=fit"
                  ),
                )
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*Card(child: ListTile(
                      title: Text("Nom & Prénom"),
                      subtitle: Text("Email"),
                    ),)*/
                  ],
                )
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute<ProfileScreen>(
                    builder: (context) => ProfileScreen(
                        appBar: AppBar(
                          title: const Text('User Profile'),
                        ),
                      actions: [
                        SignedOutAction((context) {
                          Navigator.of(context).pop();
                        })
                      ]
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Historiques"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Books()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text("Administration"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHotel()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.security_rounded),
              title: Text("Terms & Conditions"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsAndConditions()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16,0,0,0),
              child: Text("Populaires", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),),
            ),
            Container(
              height: 220,
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: _hotels.length,
                itemBuilder: (context, index) {
                final _hotel = _hotels[index];
                print(_hotel);
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: HotelCard(_hotel),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailHotel(hotel: _hotel,)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16,20,0,0),
              child: Text("Tous les hotels", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),),
            ),
            Column(
              children: _hotels.map((e){
                return GestureDetector(
                  onTap: (){
                    context.read<HotelProvider>().updateHotel(newHotel: e);
                    context.read<ReservationProvider>().setHotel(e);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailHotel(hotel: e,)),
                    );
                  },
                  child: HotelListItem(e),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
