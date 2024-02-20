import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historiques"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer
      ),
      body: ListView.builder(itemCount: 5,padding: EdgeInsets.all(10), itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Détails de payement", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                    fontSize: 18
                )),
                laLigne("ID de la Transaction", "8452azedvkjfhry965ddfkj"),
                laLigne("Date", "Les dates"),
                laLigne("Montant", "\$60"),
                laLigne("Hotel", "Nom de l'hotel"),
                laLigne("Chambre", "Type de chambre"),
                laLigne("Statut", "En attente"),
                Divider(),
                Text("Répartition des transactions", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    fontSize: 16
                )),
                laLigne("Hors taxe", "35"),
                laLigne("Taxe", "15"),
                laLigne("Total", "50"),
                Divider(),
                Container(
                  width: double.infinity,
                  child: FilledButton(onPressed: (){}, child: Text("Payer")),
                )
              ],
            ),
          ),
        );
      },),
    );
  }

  Widget laLigne(String titre, String valeur){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titre, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),),
        Text(valeur, style: TextStyle(
          fontSize: 13,
          color: valeur=="En attente" ? Colors.red : (valeur ==  "Confirmé"? Colors.green : Colors.black),
        ),)
      ],
    );
  }
}
