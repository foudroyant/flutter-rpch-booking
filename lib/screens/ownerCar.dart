import 'package:flutter/material.dart';
import 'package:rpch/screens/addChambre.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPage createState() => _CarListPage();
}

class _CarListPage extends State<CarListPage> {
  // Liste fictive d'hôtels pour démonstration
  List<Hotel> _hotels = [
    Hotel(name: 'Car A', description: 'Description du car A'),
    Hotel(name: 'Car B', description: 'Description du car B'),
    // Ajoutez d'autres hôtels selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des véhicules'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AjouterCar(),
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
                  builder: (context) => CarEditPage(hotel: _hotels[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CarEditPage extends StatefulWidget {
  final Hotel hotel;

  CarEditPage({required this.hotel});

  @override
  _CarEditPage createState() => _CarEditPage();
}

class _CarEditPage extends State<CarEditPage> {
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
        title: Text('Modifier car'),
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
            TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Marque du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.car_rental),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Modèle du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.car_rental),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Année du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),

            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Couleur du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.color_lens),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Prix',
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
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Télephone',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Quartier',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.location_on),
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
          ],
        ),
      ),
    );
  }
}


class AjouterCar extends StatelessWidget {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter véhicule'),
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
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Marque du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.car_rental),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Modèle du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.car_rental),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Année du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),

            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Couleur du véhicule",
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.color_lens),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Prix',
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
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Télephone',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    )
                )
            ),
            SizedBox(height: 16.0),
            TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Quartier',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.location_on),
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