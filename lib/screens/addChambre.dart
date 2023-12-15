import 'package:flutter/material.dart';

class ChambreHotelListPage extends StatefulWidget {
  @override
  _ChambreHotelListPage createState() => _ChambreHotelListPage();
}

class _ChambreHotelListPage extends State<ChambreHotelListPage> {
  // Liste fictive d'hôtels pour démonstration
  List<Chambre> _hotels = [
    Chambre(name: 'Chambre A', description: 'Description de la chambre A'),
    Chambre(name: 'Chambre B', description: 'Description de la chambre B'),
    // Ajoutez d'autres hôtels selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des chambres'),
      ),
      body: ListView.builder(
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_hotels[index].name),
            subtitle: Text(_hotels[index].description),
            onTap: () {
              // Naviguer vers la page d'édition de l'hôtel
              print('Connexion en cours...');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AddChambre(chambre: _hotels[index],))
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>AjouterChambre())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddChambre extends StatefulWidget {
  final Chambre chambre;

  AddChambre({required this.chambre});

  @override
  _AddChambreState createState() => _AddChambreState();
}

class _AddChambreState extends State<AddChambre> {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs avec les valeurs existantes
    _nameController.text = widget.chambre.name;
    _descriptionController.text = widget.chambre.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier la chambre'),
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
                    hintText: "Type de chambre",
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
                    hintText: 'Capacité',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.reduce_capacity),
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
                widget.chambre.name = _nameController.text;
                widget.chambre.description = _descriptionController.text;
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


class AjouterChambre extends StatelessWidget {
  // Contrôleurs pour les champs éditables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter la chambre'),
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
                    hintText: "Type de chambre",
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
                decoration: InputDecoration(
                    hintText: 'Capacité',
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.reduce_capacity),
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
                Navigator.pop(context);
              },
              child: Text('Enregistrer la chambre'),
            ),
          ],
        ),
      ),
    );
  }
}



class Chambre {
  String name;
  String description;

  Chambre({required this.name, required this.description});
}