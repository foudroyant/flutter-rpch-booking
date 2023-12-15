import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/cubit/hotel.cubit.dart';
import 'package:rpch/screens/all.dart';
import 'package:rpch/screens/booking.dart';
import 'package:rpch/screens/cars.dart';
import 'package:rpch/screens/details.dart';
import 'package:rpch/screens/evenement.dart';
import 'package:rpch/screens/logement.dart';
import 'package:rpch/screens/profil.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';
import 'package:rpch/widgets/search.dart';

class Home extends StatelessWidget {
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPCH Booking'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        actions: [
          // Ajouter une icône de profil à droite de l'AppBar
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Mettez ici le code pour gérer le clic sur l'icône du profil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Recherche',
                      filled: true,
                      fillColor: Color(0xFFe6e6e6),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      )
                  )
              ),
            ),*/

            //Hotels
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hotels',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => All()),
                    );
                  }, child: Text(
                    'Tout',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),)
                ],
              ),
            ),
            // Première liste horizontale
            Container(
              height: 155.0,
              child: BlocBuilder<HotelCubit, List<HotelModel>>(builder: (BuildContext context, state) {
                //context.read<HotelCubit>().populaires();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<HotelCubit>().state.where((element) => element.prixMoyen<=6000).toList().length,
                  itemBuilder: (BuildContext context, int index){
                    final HotelModel _hotel = context.read<HotelCubit>().state[index];
                    return HotelCard(_hotel.nom, _hotel.localisation, 'chambre.jpg', (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HotelDetailsPage(_hotel)),
                      );
                    });
                  },
                );
              },),
            ),

            //Logements
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Logements',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>AllLogement()));
                  }, child: Text(
                    'Tout',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),)
                ],
              ),
            ),
            //Liste des logements
            Container(
              height: 155.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: maisons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Maison maison = maisons[index];
                  return LogementCard('${maison.label}', '${maison.localisation}', 'chambre.jpg', ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          HouseDetailsPage(maison)), // Remplacez "NouvellePage" par le nom de votre nouvelle page
                    );
                  }
                  );},
              ),
            ),


            //Liste des événements
            /*Container(
              height: 155.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: evenements.length,
                itemBuilder: (BuildContext context, int index){
                  final Evenement evenement = evenements[index];
                  return HotelCard('${evenement.label}', '${evenement.localisation}', 'chambre.jpg', (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventDetailsPage(evenement)), // Remplacez "NouvellePage" par le nom de votre nouvelle page
                    );
                  });
                },
              ),
            ),*/

            //Liste des Véhicules
            //Evenements
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voitures',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Search(laListe: listeVoitures )));
                  }, child: Text(
                    'Tout',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),)
                ],
              ),
            ),
            Container(
              height: 155.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listeVoitures.sublist(0,4).length,
                itemBuilder: (BuildContext context, int index){
                  final Car car = listeVoitures[index];
                  return HotelCard('${car.marque}', '${car.localite}', 'chambre.jpg', (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarDetails(car)), // Remplacez "NouvellePage" par le nom de votre nouvelle page
                    );
                  });
                },
              ),
            ),

            // Deuxième liste verticale
            /*Expanded(
              child: ListView(
                children: [
                  HotelListItem('Hotel 1', 'Ville 1', 'chambre.jpg', (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelDetailsPage()),
                    );
                  }),
                  HotelListItem('Hotel 2', 'Ville 2', 'chambre.jpg', (){}),
                  HotelListItem('Hotel 3', 'Ville 3', 'chambre.jpg', (){}),
                  HotelListItem('Hotel 4', 'Ville 4', 'chambre.jpg', (){}),
                  HotelListItem('Hotel 5', 'Ville 5', 'chambre.jpg', (){}),
                  // Ajoutez d'autres éléments de la liste ici...
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}


class HotelCard extends StatelessWidget {
  final String name;
  final String city;
  final String image;
  final VoidCallback onPressed;

  HotelCard(this.name, this.city, this.image, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/$image',
              height: 80.0,
              width: 120.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(city),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Logements
class LogementCard extends StatelessWidget {
  final String name;
  final String city;
  final String image;
  final VoidCallback onPressed;

  LogementCard(this.name, this.city, this.image, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/$image',
              height: 80.0,
              width: 120.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(city),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HotelList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final hotel = hotels[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/chambre.jpg'),
          ),
          title: Text(hotel.nom),
          subtitle: Text(hotel.localisation),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelDetailsPage(hotel)),
            );
          },
        );
      },
    );
  }
}