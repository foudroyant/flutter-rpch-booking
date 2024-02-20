import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rpchbooking/screens/inscription.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordCtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10,30,10,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*Text(
                'RPCH',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800
                ),
              ),*/
              Lottie.asset("assets/lotties/hotel.json", height: 150),
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
                        Text("Bienvenu!", style: TextStyle(
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
                            controller: _emailController,
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
                            obscureText: true,
                            controller: _passwordCtroller,
                            decoration: InputDecoration(
                                hintText: "Password",
                              border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton.icon(onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: "stephanebazebibouta@gmail.com",
                                password: "777eglise"
                            );
                            print(credential);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        }, icon: Icon(Icons.lock_open),
                        label: Text("Connectez-vous"), ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){
                FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
              }, child: Row(
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
                  Text("Vous n'avez pas de compte? ", style: TextStyle(
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
                        MaterialPageRoute(builder: (context) => Inscription()),
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

