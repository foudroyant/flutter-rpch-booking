import 'package:flutter/material.dart';
import 'package:rpch/utils/models.dart';

class HouseDetails {
  final String mainImage;
  final List<String> additionalImages;
  final String details;

  HouseDetails({
    required this.mainImage,
    required this.additionalImages,
    required this.details,
  });
}

class HouseDetailsPage extends StatelessWidget {
  final Maison maison;
  final HouseDetails houseDetails = HouseDetails(
    mainImage: 'assets/images/chambre.jpg',
    additionalImages: [
      'assets/images/chambre.jpg',
      'assets/images/chambre.jpg',
      'assets/images/chambre.jpg',
      'assets/images/chambre.jpg',
    ],
    details:
    'Spacieuse maison familiale avec 4 chambres, 3 salles de bains, cuisine moderne, grand jardin et bien plus encore.',
  );

  HouseDetailsPage(this.maison);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Maison'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              houseDetails.mainImage,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${maison.label}',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(maison.description),
                  SizedBox(height: 5.0),
                  Text("${maison.localisation}, quartier ${maison.quartier}"),
                  SizedBox(height: 5.0),
                  Text("${maison.prix}FCFA", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  Text(
                    'Autres Images',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: maison.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      houseDetails.additionalImages[index],
                      height: 100.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajoutez ici la logique pour la visite
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirmation de la réservation'),
                content: Text('La maison ${maison.label} réservé avec succès! Le prix de la reservation est de ${maison.prix}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
          print('Lancer la visite');
        },
        child: Icon(Icons.calendar_today_outlined),
      ),
    );
  }
}
