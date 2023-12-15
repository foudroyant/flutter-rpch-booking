import 'package:flutter/material.dart';
import 'package:rpch/widgets/Liste.dart';

class AdminListPage extends StatefulWidget {
  @override
  _AdminListPageState createState() => _AdminListPageState();
}

class _AdminListPageState extends State<AdminListPage> {
  // Liste fictive d'hôtels pour démonstration
  List<Hotel> _pendingHotels = [
    Hotel(name: 'Toyota', description: 'Deux cylindres'),
    Hotel(name: 'Chambre salon', description: 'Quartier Nkouinkou'),
    // Ajoutez d'autres hôtels en attente selon vos besoins
  ];
  Composants composants = Composants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des éléments en attente'),
      ),
      body: ListView.builder(
        itemCount: _pendingHotels.length,
        itemBuilder: (context, index) {
          final item = _pendingHotels[index];
          return composants.enAttente(item.name, item.description, "20000", "", (){
            // Naviguer vers la page d'approbation
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminHotelApprovalPage(
                  hotel: _pendingHotels[index],
                  onApproval: () {
                    // Mettre à jour l'état après l'approbation et revenir à la liste
                    setState(() {
                      _pendingHotels.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class AdminHotelApprovalPage extends StatelessWidget {
  final Hotel hotel;
  final Function onApproval;
  Composants composants = Composants();

  AdminHotelApprovalPage({required this.hotel, required this.onApproval});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approbation de l\'hôtel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/chambre.jpg', // Remplacez par l'URL de votre image
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8,),
            composants.HorizontalListe(context, ["", "", ""]),
            SizedBox(height: 16,),
            Text('Nom de l\'hôtel: ${hotel.name}'),
            Text('Description: ${hotel.description}'),
            ElevatedButton(
              onPressed: () {
                // Logique d'approbation de l'hôtel
                // Vous pouvez appeler une fonction d'approbation dans votre backend ici
                onApproval();
              },
              child: Text('Approuver'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logique de refus de l'hôtel
                // Vous pouvez appeler une fonction de refus dans votre backend ici
                Navigator.pop(context);
              },
              child: Text('Refuser'),
            ),
          ],
        ),
      ),
    );
  }
}


class AdminLogementApprovalPage extends StatelessWidget {
  final Hotel hotel;
  final Function onApproval;
  Composants composants = Composants();

  AdminLogementApprovalPage({required this.hotel, required this.onApproval});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approbation du logement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/chambre.jpg', // Remplacez par l'URL de votre image
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8,),
            composants.HorizontalListe(context, ["", "", ""]),
            SizedBox(height: 16,),
            Text('Label du logement: ${hotel.name}'),
            Text('Description: ${hotel.description}'),
            ElevatedButton(
              onPressed: () {
                // Logique d'approbation de l'hôtel
                // Vous pouvez appeler une fonction d'approbation dans votre backend ici
                onApproval();
              },
              child: Text('Approuver'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logique de refus de l'hôtel
                // Vous pouvez appeler une fonction de refus dans votre backend ici
                Navigator.pop(context);
              },
              child: Text('Refuser'),
            ),
          ],
        ),
      ),
    );
  }
}



class AdminCartApprovalPage extends StatelessWidget {
  final Hotel hotel;
  final Function onApproval;
  Composants composants = Composants();

  AdminCartApprovalPage({required this.hotel, required this.onApproval});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approbation du véhicule'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/chambre.jpg', // Remplacez par l'URL de votre image
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8,),
            composants.HorizontalListe(context, ["", "", ""]),
            SizedBox(height: 16,),
            Text('Model du Car: ${hotel.name}'),
            Text('Description: ${hotel.description}'),
            ElevatedButton(
              onPressed: () {
                // Logique d'approbation de l'hôtel
                // Vous pouvez appeler une fonction d'approbation dans votre backend ici
                onApproval();
              },
              child: Text('Approuver'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logique de refus de l'hôtel
                // Vous pouvez appeler une fonction de refus dans votre backend ici
                Navigator.pop(context);
              },
              child: Text('Refuser'),
            ),
          ],
        ),
      ),
    );
  }
}



class Hotel {
  String name;
  String description;

  Hotel({required this.name, required this.description});
}