import 'package:flutter/material.dart';
import 'package:rpch/utils/models.dart';

class EventDetails {
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String eventDescription;
  final String eventImage;

  EventDetails({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventDescription,
    required this.eventImage,
  });
}

class EventDetailsPage extends StatelessWidget {
  final Evenement evenement;
  final EventDetails eventDetails = EventDetails(
    eventName: 'Concert en plein air',
    eventDate: '22 Novembre 2023',
    eventLocation: 'Parc de la Ville',
    eventDescription:
    'Rejoignez-nous pour une soirée inoubliable avec des performances musicales en direct et une ambiance festive.',
    eventImage: 'assets/images/chambre.jpg',
  );

  EventDetailsPage(this.evenement);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'Événement'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              eventDetails.eventImage,
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
                    "${evenement.label}",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Date: ${eventDetails.eventDate}'),
                  Text('Lieu: ${eventDetails.eventLocation}'),
                  SizedBox(height: 16.0),
                  Text(
                    'Description de l\'Événement',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text("${evenement.description}"),
                  SizedBox(height: 16.0),

                  Text("Hôte", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.png'),
                        radius: 50.0,
                      ),
                      title: Text(evenement.hote["nom"], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                      subtitle: Text(evenement.hote["details"]),
                    ),
                  ),

                  SizedBox(height: 16.0),

                  Text("Invités", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Column(
                    children: [
                      for(Map invite in evenement.invites)
                        Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/user.png'),
                              radius: 50.0,
                            ),
                            title: Text(invite["nom"], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                            subtitle: Text(invite["details"]),
                          ),
                        ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajoutez ici la logique pour la réservation
          print('Réserver cet événement');
        },
        child: Icon(Icons.event_seat),
      ),
    );
  }
}
