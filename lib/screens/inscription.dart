import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rpchbooking/screens/authentification.dart';


class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10,30,10,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'RPCH',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white70, // Couleur de fond du conteneur
                    ),
                    child: Column(
                      children: [
                        Text("Rejoignez-nous!", style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),),
                        SizedBox(height: 10,),
                        Text("Indentifiez-vous pour continuer.", style: TextStyle(
                          fontSize: 18,
                        ),),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Couleur de fond du conteneur
                            borderRadius: BorderRadius.circular(10.0), // Bords arrondis
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Couleur de fond du conteneur
                            borderRadius: BorderRadius.circular(10.0), // Bords arrondis
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Couleur de fond du conteneur
                            borderRadius: BorderRadius.circular(10.0), // Bords arrondis
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Confirmer Password",
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.lock_open),
                          label: Text("Inscrivez-vous"), ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lotties/google.json", repeat: false, height: 50),
                  Text("Continuer avec Google")
                ],
              ), ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous avez déjà un compte? ", style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400]
                  ),),
                  GestureDetector(
                    child: Text("Cliquez ici", style: TextStyle(
                      fontSize: 14,
                    )),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Authentification()),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
