import 'package:flutter/material.dart';
import 'package:rpchbooking/models/hotel.dart';

class HotelCard extends StatelessWidget {
  final HotelModel _hotel;
  HotelCard(this._hotel);

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
              _hotel.images[0],
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
                Container(
                  width : 180,
                  child: Text(
                    _hotel.nom,
                    //maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '\$${_hotel.prix["usd"]} par nuit',
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


class HotelListItem extends StatelessWidget {

  final HotelModel _hotel;

  HotelListItem(this._hotel);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.fromLTRB(8.0, 5,8,5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image à gauche
          Container(
            width: 120.0,
            height: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              child: Image.network(
                _hotel.images[0],
                //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/66191826.jpg?impolicy=resizecrop&rw=1200&ra=fit",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Textes à droite
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _hotel.nom,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    _hotel.localisation,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '\$${_hotel.prix["usd"]} par nuit',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}