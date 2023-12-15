import 'package:flutter/material.dart';
import 'package:rpch/screens/addChambre.dart';

class LogementListPage extends StatefulWidget {
  @override
  _LogementListPage createState() => _LogementListPage();
}

class _LogementListPage extends State<LogementListPage> {
  // Liste fictive d'hôtels pour démonstration
  List<Hotel> _hotels = [
    Hotel(name: 'Logement A', description: 'Description du logement A'),
    Hotel(name: 'Logement B', description: 'Description du logement B'),
    // Ajoutez d'autres hôtels selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des logements'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AjouterLogement(),
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
                  builder: (context) => LogementEditPage(hotel: _hotels[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LogementEditPage extends StatefulWidget {
  final Hotel hotel;

  LogementEditPage({required this.hotel});

  @override
  _LogementEditPage createState() => _LogementEditPage();
}

class _LogementEditPage extends State<LogementEditPage> {
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
        title: Text('Modifier logement'),
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
            SizedBox(height: 16.0),
            TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Label du logement",
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


class AjouterLogement extends StatelessWidget {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter logement'),
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
                    hintText: "Label du logement",
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
              child: Text('Enregistrer le logement'),
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