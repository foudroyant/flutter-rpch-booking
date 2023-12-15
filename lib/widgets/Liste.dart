import 'package:flutter/material.dart';

class Composants {

  //Une liste horizontale
  Widget HorizontalListe(BuildContext context, List liste) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: liste.length, // Ajoutez plus d'images au besoin
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
    ) ;
  }

  Widget enAttente(String title, String subtitle, String price, String image, VoidCallback onPressed){
    return Card(
      child: ListTile(
        leading: Container(
          child: Image.asset(
            'assets/images/chambre.jpg', // Remplacez par l'URL de vos images supplémentaires
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        trailing: Text(price),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onPressed,
      ),
    );
  }

}


/*
Card(
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/chambre.jpg', // Remplacez par l'URL de vos images supplémentaires
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Text("10000FCFA"),
              title: Text(_pendingHotels[index].name),
              subtitle: Text(_pendingHotels[index].description),
              onTap: () {
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
              },
            ),
          );
 */