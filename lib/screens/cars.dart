import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/cubit/bookcar.cubit.dart';
import 'package:rpch/utils/models.dart';

class CarDetails extends StatelessWidget {
  final Car selectedCar;

  CarDetails(this.selectedCar);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCarCubit, BookCarModel>(
      builder: (BuildContext context, state) {
        final bC = context.read<BookingCarCubit>();
        bC.setCar(selectedCar);
        return Scaffold(
            appBar: AppBar(
              title: const Text('Détails de la Location'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/chambre.jpg', // Remplacez par l'URL de votre image
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedCar.marque} ${selectedCar.modele} (${selectedCar.annee})',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text('Couleur: ${selectedCar.couleur}'),
                        Text('Prix journalier: ${selectedCar.prix}'),
                        Text('Localité: ${selectedCar.localite} - ${selectedCar.quartier}'),
                        SizedBox(height: 16.0),
                        const Text(
                          'Images supplémentaires',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                        ListTile(
                          title: const Text("Apercu de la reservation"),
                          subtitle: Text("La reservation s'élève à ${bC.state.montant}"),
                          trailing: Text("${(bC.state.start.day - bC.state.end.day).abs()} Jour(s)"),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton.icon(
                          onPressed: () {

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Confirmation de la réservation'),
                                  content: Text('Véhicule ${selectedCar.marque} réservé avec succès! \nLa reservation est valable pour ${(bC.state.start.day - bC.state.end.day).abs()} Jour(s)'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.payment),
                          label: Text('Réserver maintenant'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showCustomDateRangePicker(
              context,
              dismissible: true,
              minimumDate: DateTime.now().subtract(const Duration(days: 30)),
              maximumDate: DateTime.now().add(const Duration(days: 30)),
              endDate: bC.state.end,
              startDate: bC.state.start,
              backgroundColor: Colors.white,
              primaryColor: Colors.green,
              onApplyClick: (start, end) {
                bC.setDate(start, end);
                double montant =((bC.state.start.day - bC.state.end.day)*selectedCar.prix).abs();
                bC.setMontant(montant);
                print("Jours de reservation : ${(bC.state.start.day - bC.state.end.day).abs()}");
                print("La reservation s'élève à ${montant} FCFA");
              },
              onCancelClick: () {
                bC.setDate(DateTime.now(), DateTime.now());
                double montantTotal = ((bC.state.start.day - bC.state.end.day)*selectedCar.prix).abs();
                bC.setMontant(montantTotal);
              },
            );
          }, child: Icon(Icons.calendar_month_outlined)),
          );
      }
    );
  }
}
