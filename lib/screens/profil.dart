import 'package:flutter/material.dart';
import 'package:rpch/screens/admin.dart';
import 'package:rpch/screens/books.dart';
import 'package:rpch/screens/owner.dart';
import 'package:rpch/screens/ownerCar.dart';
import 'package:rpch/screens/ownerLogement.dart';

class UserProfile {
  final String photoUrl;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  UserProfile({
    required this.photoUrl,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
  });
}
/*
class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Couleur de fond du Container
      ),
      home: UserProfileScreen(),
    );
  }
}*/

class UserProfileScreen extends StatelessWidget {
  final UserProfile user = UserProfile(
    photoUrl: 'chambre.jpg', // Remplacez par le chemin réel de l'image
    email: 'utilisateur@example.com',
    phoneNumber: '+1234567890',
    firstName: 'John',
    lastName: 'Doe',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Utilisateur'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
              },
            ),
          ]
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Image.asset(
              'assets/images/${user.photoUrl}', // Remplacez par l'URL de votre image
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nom: ${user.firstName} ${user.lastName}', style: TextStyle(fontSize: 18.0)),
                  Text('Email: ${user.email}'),
                  Text('Numéro de téléphone: ${user.phoneNumber}'),
                  SizedBox(height: 8.0),
                  Column(
                    children: [
                      buildMenuItem(context, 'Mes Réservations', () {
                        // Naviguez vers la page des réservations
                        // Utilisez Navigator.push() avec MaterialPageRoute
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Books()),
                        );
                      }),
                      buildMenuItem(context, 'Modifier le Mot de Passe', () {
                        // Naviguez vers la page de modification du mot de passe
                        // Utilisez Navigator.push() avec MaterialPageRoute
                      }),
                      buildMenuItem(context, 'Modifier le Nom et Prénom', () {
                        // Naviguez vers la page de modification du nom et prénom
                        // Utilisez Navigator.push() avec MaterialPageRoute
                      }),
                      buildMenuItem(context, 'Devenir propriétaire', () {
                        // Naviguez vers la page de modification du nom et prénom
                        // Utilisez Navigator.push() avec MaterialPageRoute
                      }),
                      buildMenuItem(context, 'Administration Hotels', () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>HotelListPage())
                        );
                      }),
                      buildMenuItem(context, 'Administration Logements', () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>LogementListPage())
                        );
                      }),
                      buildMenuItem(context, 'Administration Véhicules', () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>CarListPage())
                        );
                      }),
                      buildMenuItem(context, 'Administration', () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>AdminListPage())
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: ListTile(
          onTap: onPressed,
          title: Text(title),
        ),
      )
    );
  }
}
