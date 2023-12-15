import 'package:flutter/material.dart';
import 'package:rpch/screens/booking.dart';
import 'package:rpch/screens/books.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class HotelDetailsPage extends StatelessWidget {
  final HotelModel hotel;

  HotelDetailsPage(this.hotel);

  @override
  Widget build(BuildContext context) {
    List<ChambreModel> lesChambres = chambres.where((element) => element.hotel==hotel.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'Hôtel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image principale de l'hôtel
            Image.asset(
              'assets/images/chambre.jpg',
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Informations sur l'hôtel
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.nom,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Prix moyen par nuit: ${hotel.prixMoyen} FCFA'),
                  SizedBox(height: 8.0),
                  Text('Équipements: ${hotel.equipements.toString()}'),
                  SizedBox(height: 8.0),
                  Text('Services: ${hotel.services.toString()}'),
                ],
              ),
            ),

            // Liste horizontale pour afficher d'autres images de l'hôtel
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotel.images.length,
                itemBuilder: (BuildContext context, int index){
                  return HotelImage('chambre.jpg');
                },
              ),
            ),

            // Liste horizontale pour afficher la liste des chambres
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lesChambres.length,
                itemBuilder: (BuildContext context, int index) {
                  final ChambreModel laChambre = lesChambres[index];
                  return RoomItem('${laChambre.type}', '${laChambre.prix}FCFA/nuit', 'chambre.jpg', (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelRoomDetails(hotel,laChambre)),
                    );
                  });
                },

              ),
            ),

            // Carte Map statique
            Container(
              height: 200.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              // Ajoutez ici le widget Map statique (peut-être utiliser le package google_maps_flutter),
              // ou un simple widget Image avec la carte si vous ne nécessitez pas d'interaction.
            ),
          ],
        ),
      ),
    );
  }
}

class HotelImage extends StatelessWidget {
  final String imagePath;

  HotelImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/$imagePath',
          height: 120.0,
          width: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class RoomItem extends StatelessWidget {
  final String roomType;
  final String pricePerNight;
  final String imagePath;
  final VoidCallback onPressed;

  RoomItem(this.roomType, this.pricePerNight, this.imagePath, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                'assets/images/$imagePath',
                height: 80.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Card(child: ListTile(
              onTap: onPressed,
              title: Text(
                roomType,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(pricePerNight),
            ),),
          ],
        ),
      ),
    );
  }
}
