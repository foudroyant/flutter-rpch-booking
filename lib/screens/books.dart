import 'package:flutter/material.dart';

class Reservation {
  final String hotel;
  final String chambre;
  final double montant;
  final String statut;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String infoPaiement;
  final String image;

  Reservation({
    required this.hotel,
    required this.chambre,
    required this.montant,
    required this.statut,
    required this.dateDebut,
    required this.dateFin,
    required this.infoPaiement,
    required this.image,
  });
}


class Books extends StatelessWidget {
  final List<Reservation> reservations = [
    Reservation(
      hotel: 'Hotel A',
      chambre: 'Chambre Simple',
      montant: 120.0,
      statut: 'Confirmée',
      dateDebut: DateTime(2023, 1, 1),
      dateFin: DateTime(2023, 1, 5),
      infoPaiement: 'Paiement effectué',
      image: 'hotel_a.jpg',
    ),
    Reservation(
      hotel: 'Hotel B',
      chambre: 'Chambre Double',
      montant: 200.0,
      statut: 'En attente',
      dateDebut: DateTime(2023, 2, 10),
      dateFin: DateTime(2023, 2, 15),
      infoPaiement: 'En attente de paiement',
      image: 'hotel_b.jpg',
    ),
    // Ajoutez d'autres réservations selon vos besoins
  ];

  /*
  * return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Couleur de fond du Container
      ),
      home: UserProfileScreen(),
    );
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Réservations d\'Hôtel'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/chambre.jpg'),
              ),
              title: Text('${reservation.hotel} - ${reservation.chambre}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Montant: ${reservation.montant}'),
                  Text('Statut: ${reservation.statut}'),
                  Text('Dates de séjour: ${reservation.dateDebut} - ${reservation.dateFin}'),
                  Text('Informations de paiement: ${reservation.infoPaiement}'),
                ],
              ),
              onTap: () {
                // Ajoutez ici la logique pour afficher les détails de la réservation
                // Vous pouvez naviguer vers une nouvelle page ou afficher un dialogue.
              },
            ),
          );
        },
      ),
    );
  }
}
