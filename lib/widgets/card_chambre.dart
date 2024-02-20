import 'package:flutter/material.dart';
import 'package:rpchbooking/models/chambre.dart';

class ChambreCard extends StatelessWidget {
  final ChambreModel chambre;

  ChambreCard(this.chambre);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.network(
              chambre.images[0],
              //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/b460bc29.jpg?impolicy=resizecrop&rw=1200&ra=fit",
              width: 200.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chambre.type,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '\$${chambre.prix["usd"]}/nuit',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
