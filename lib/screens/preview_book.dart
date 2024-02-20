import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/models/chambre.dart';
import 'package:rpchbooking/models/hotel.dart';
import 'package:rpchbooking/models/user.dart';
import 'package:rpchbooking/providers/chambre.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';

class PreviewBook extends StatefulWidget {
  const PreviewBook({Key? key}) : super(key: key);

  @override
  State<PreviewBook> createState() => _PreviewBookState();
}

class _PreviewBookState extends State<PreviewBook> {
  //User user = new User(id: id, email: email, name: name, photo: photo);

  @override
  Widget build(BuildContext context) {
    //print(context.watch<HotelProvider>().hotel);

    return Scaffold(
      appBar: AppBar(
        title: Text("Aperçu de la réservation"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                        context.watch<ReservationProvider>().chambre.images[0]
                        //"https://images.trvl-media.com/lodging/17000000/16280000/16271500/16271457/66191826.jpg?impolicy=resizecrop&rw=1200&ra=fit"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            _buildInfoReservation('Nom de l\'hôtel', context.watch<ReservationProvider>().hotel.nom),
            _buildInfoReservation('Chambre', context.watch<ReservationProvider>().chambre.type),
            _buildInfoReservation('Dates', context.watch<ReservationProvider>().dates.join(" - ")),
            _buildInfoReservation('Nombre de jours', context.watch<ReservationProvider>().jours.toString()),
            _buildInfoReservation('Prix par nuit', '\$${context.watch<ReservationProvider>().chambre.prix['usd']}'),
            _buildInfoReservation('Prix total', '\$${context.watch<ReservationProvider>().toMap()['montant']}'),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Colors.white70,
        ),
        child: FilledButton.icon(
          onPressed: (){}, icon: Icon(Icons.book), label: Text("Réserver Maintenant"),
          style: const ButtonStyle(
          ),
        ),
      ),
    );
  }

  Widget _buildInfoReservation(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),),
        subtitle: Text(value, style: TextStyle(
          fontSize: 14,
        ),),
      ),
    );
  }
}
