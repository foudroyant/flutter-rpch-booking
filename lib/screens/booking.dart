import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/cubit/bookhotel.cubit.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class HotelRoomDetails extends StatelessWidget {

  final HotelModel _hotel;
  final ChambreModel _chambre;

  ChambreModel chambre = chambres.first;
  DateTime startDate = new DateTime.now();
  DateTime endDate = new DateTime.now();

  HotelRoomDetails(this._hotel, this._chambre);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHotel, BookHotelModel>(builder: (BuildContext context, state){
      final bh = context.read<BookingHotel>();
      bh.setHotelAndRom(_hotel.id, _chambre.id);
      bh.setStatut("En attente");
      return Scaffold(
        appBar: AppBar(
          title: Text('Détails de la chambre d\'hôtel'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 30)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: bh.state.end,
              startDate: bh.state.start,
              backgroundColor: Colors.white,
              primaryColor: Colors.green,
              onApplyClick: (start, end) {
                /*setState(() {
                endDate = end;
                startDate = start;
              });*/
                bh.setDate(start, end);
                int montantTotal = ((bh.state.start.day - bh.state.end.day)*_chambre.prix).abs();
                bh.setMontant(montantTotal);
                print("La reservation s'élève à ${montantTotal}");
              },
              onCancelClick: () {
                /*setState(() {
                endDate = null;
                startDate = null;
              });*/
                bh.setDate(DateTime.now(), DateTime.now());
                int montantTotal = ((bh.state.start.day - bh.state.end.day)*_chambre.prix).abs();
                bh.setMontant(montantTotal);
              },
            );
          },
          tooltip: 'choose date Range',
          child: const Icon(Icons.calendar_today_outlined, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Affichez ici l'image de couverture de la chambre
              // Utilisez AssetImage pour les images provenant des ressources locales
              Image.asset(
                'assets/images/chambre.jpg',
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_chambre.type}',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text('Prix par nuit: ${_chambre.prix} FCFA'),
                    Text('Capacité: ${_chambre.capacite}'),
                    Text('Disponibilité: [Disponibilité]'),
                    Text('Équipements: ${_chambre.equipements.toString()}'),

                    SizedBox(height: 16.0),

                    // Ajoutez ici un sélecteur de dates pour la réservation
                    // Vous pouvez utiliser la bibliothèque date_range_picker pour cela

                    SizedBox(height: 16.0),

                    // Affichez ici une liste horizontale d'images
                    // Utilisez AssetImage pour les images provenant des ressources locales
                    Text(
                      'Autres images',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3, // Remplacez par le nombre réel d'images
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/chambre.jpg',
                              height: 80.0,
                              width: 80.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Aperçu de la reservation"),
                      subtitle: Text("Montant total : ${bh.state.montantTotal} FCFA"),
                      trailing: Text("${(bh.state.start.day - bh.state.end.day).abs().toString()} Jour(s)"),
                    ),
                    ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.payment), label: Text("Reserver maintenant"))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
