import 'package:flutter/material.dart';
import 'package:rpch/screens/cars.dart';
import 'package:rpch/utils/models.dart';

class Search extends StatelessWidget {
  final List laListe;
  const Search({Key? key, required this.laListe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate(laListe));
          }, icon: Icon(Icons.search))
        ],
      ),

      body: Column(
        children: [
          Container(
            height: 100, width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.hotel), label: Text("Nom")),
                ElevatedButton.icon(onPressed: (){
                }, icon: Icon(Icons.location_on), label: Text("Localité")),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.monetization_on), label: Text("Prix")),
              ],
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index){
            final Car item = laListe[index];

            return Card(
              child: ListTile(
                trailing: Text("${item.prix}"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CarDetails(item))
                  );
                },
                leading: Image.asset(
                  'assets/images/${item.image}',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
                title: Text("${item.marque}"),
                subtitle: Text("${item.localite}"),
              ),
            );
          }, itemCount: laListe.length, shrinkWrap: true)
          ),
        ],
      ),
    );
  }
}



class MySearchDelegate extends SearchDelegate {
  final List laListe;
  MySearchDelegate(this.laListe);

  @override
  Widget? buildLeading(BuildContext context) =>IconButton(onPressed: (){
    close(context, null);
  }, icon: Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) =>[
    IconButton(onPressed: (){
      if(query.isEmpty){
        close(context, null);
      }else {
        query = "";
      }
    }, icon: Icon(Icons.clear))
  ];

  @override
  Widget buildSuggestions(BuildContext context) {

    List suggestions = laListe.where((element){
      return element.marque.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      final Car item = suggestions[index];

      return Card(
        child: ListTile(
          trailing: Text("${item.prix}"),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>CarDetails(item))
            );
          },
          leading: Image.asset(
            'assets/images/${item.image}',
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          title: Text("${item.marque}"),
          subtitle: Text("${item.localite}"),
        ),
      );
    }, itemCount: suggestions.length,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}