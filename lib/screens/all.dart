import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/cubit/hotel.cubit.dart';
import 'package:rpch/screens/details.dart';
import 'package:rpch/screens/evenement.dart';
import 'package:rpch/screens/logement.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class All extends StatelessWidget {
  const All({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate());
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
            Expanded(child: BlocBuilder<HotelCubit, List<HotelModel>>(
              builder: (BuildContext context, state){
                final cb = context.read<HotelCubit>();
                return ListView.builder(itemBuilder: (BuildContext context, int index){
                  final HotelModel hotel = context.read<HotelCubit>().state[index];
                  return Card(
                    child: ListTile(
                      trailing: Text("${hotel.prixMoyen}"),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HotelDetailsPage(hotel)),
                        );
                      },
                      leading: Image.asset(
                        'assets/images/chambre.jpg',
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text("${hotel.nom}"),
                      subtitle: Text("${hotel.localisation}"),
                    ),
                  );
                }, itemCount: cb.state.length, shrinkWrap: true);
              },
            )
            ),
          ],
        ),
    );
  }
}


//ALL LOGEMENTS
class AllLogement extends StatelessWidget {
  const AllLogement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: LogementSearchDelegate());
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
            Maison _maison = maisons[index];
            return Card(
              child: ListTile(
                trailing: Text("${_maison.prix}FCFA"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HouseDetailsPage(_maison)),
                  );
                },
                leading: Image.asset(
                  'assets/images/chambre.jpg',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
                title: Text("${_maison.label}"),
                subtitle: Text("${_maison.localisation}"),
              ),
            );
          }, itemCount: maisons.length, shrinkWrap: true)
          ),
        ],
      ),
    );
  }
}
//FIN LOGEMENT


//ALL EVENEMENTS
class AllEvent extends StatelessWidget {
  const AllEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: EventSearchDelegate());
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
            Evenement _event = evenements[index];
            return Card(
              child: ListTile(
                trailing: Text("${_event.prix}FCFA"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventDetailsPage(_event)),
                  );
                },
                leading: Image.asset(
                  'assets/images/chambre.jpg',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
                title: Text("${_event.label}"),
                subtitle: Text("${_event.localisation}"),
              ),
            );
          }, itemCount: evenements.length, shrinkWrap: true)
          ),
        ],
      ),
    );
  }
}

//FIN EVENEMENT



class MySearchDelegate extends SearchDelegate {

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
    List localites = hotels;

    List suggestions = localites.where((element){
      return element.nom.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      HotelModel hotel = suggestions[index];
      print(hotel.nom);
      return Card(
        child: ListTile(
          trailing: Text("${hotel.prixMoyen}"),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelDetailsPage(hotel)),
            );
          },
          leading: Image.asset(
            'assets/images/chambre.jpg',
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          title: Text("${hotel.nom}"),
          subtitle: Text("${hotel.localisation}"),
        ),
      );
    }, itemCount: suggestions.length,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}


class EventSearchDelegate extends SearchDelegate {

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

    List suggestions = evenements.where((element){
      return element.label.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      Evenement _event = suggestions[index];
      print(_event.label);
      return Card(
        child: ListTile(
          trailing: Text("${_event.prix}"),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDetailsPage(_event)),
            );
          },
          leading: Image.asset(
            'assets/images/chambre.jpg',
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          title: Text("${_event.label}"),
          subtitle: Text("${_event.localisation}"),
        ),
      );
    }, itemCount: suggestions.length,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}


class LogementSearchDelegate extends SearchDelegate {

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

    List suggestions = maisons.where((element){
      return element.label.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      Maison _maison = suggestions[index];
      print(_maison.label);
      return Card(
        child: ListTile(
          trailing: Text("${_maison.prix}"),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>HouseDetailsPage(_maison)),
            );
          },
          leading: Image.asset(
            'assets/images/chambre.jpg',
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
          ),
          title: Text("${_maison.label}"),
          subtitle: Text("${_maison.localisation}"),
        ),
      );
    }, itemCount: suggestions.length,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}