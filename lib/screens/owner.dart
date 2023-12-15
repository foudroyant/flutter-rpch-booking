import 'package:flutter/material.dart';
import 'package:rpch/screens/addChambre.dart';

class HotelListPage extends StatefulWidget {
  @override
  _HotelListPageState createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  // Liste fictive d'hôtels pour démonstration
  List<Hotel> _hotels = [
    Hotel(name: 'Hôtel A', description: 'Description de l\'hôtel A'),
    Hotel(name: 'Hôtel B', description: 'Description de l\'hôtel B'),
    // Ajoutez d'autres hôtels selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des hôtels'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AjouterHotel(),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_hotels[index].name),
            subtitle: Text(_hotels[index].description),
            onTap: () {
              // Naviguer vers la page d'édition de l'hôtel
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelEditPage(hotel: _hotels[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HotelEditPage extends StatefulWidget {
  final Hotel hotel;

  HotelEditPage({required this.hotel});

  @override
  _HotelEditPageState createState() => _HotelEditPageState();
}

class _HotelEditPageState extends State<HotelEditPage> {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs avec les valeurs existantes
    _nameController.text = widget.hotel.name;
    _descriptionController.text = widget.hotel.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier l\'hôtel'),
        /*actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
            },
          ),
        ],*/
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
            SizedBox(height: 8.0),
            /*Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Ajoutez plus d'images au besoin
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/images/chambre.jpg', // Remplacez par l'URL de vos images supplémentaires
                      height: 100.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),*/
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Nom de l'hotel",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.hotel),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Description de l'hotel",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Prix moyen',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Localisation',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Services, séparez-les par un ";"',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.room_service),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Equipements, séparez-les par un ";"',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.devices),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Enregistrer les modifications et revenir à la liste
                // Vous devez implémenter la logique de sauvegarde ici
                widget.hotel.name = _nameController.text;
                widget.hotel.description = _descriptionController.text;
                Navigator.pop(context);
              },
              child: Text('Enregistrer les modifications'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print('Connexion en cours...');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ChambreHotelListPage())
                );
              },
              child: Text('Les chambres'),
            ),
          ],
        ),
      ),
    );
  }
}


class AjouterHotel extends StatelessWidget {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier l\'hôtel'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
            },
          ),
        ],
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
            SizedBox(height: 8.0),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Ajoutez plus d'images au besoin
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/images/chambre.jpg', // Remplacez par l'URL de vos images supplémentaires
                      height: 100.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Nom de l'hotel",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.hotel),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Description de l'hotel",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Prix moyen',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Localisation',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Services, séparez-les par un ";"',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.room_service),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Equipements, séparez-les par un ";"',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.devices),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                //Navigator.pop(context);
              },
              child: Text('Enregistrer les modifications'),
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