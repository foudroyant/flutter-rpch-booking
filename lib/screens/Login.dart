import 'package:flutter/material.dart';
import 'package:rpch/screens/home.dart';
import 'package:rpch/screens/inscription.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPCH-Booking"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/book2.jpg',
                height: 150.0,
              ),
              SizedBox(height: 30.0),
              EmailPasswordForm(),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Ajoutez ici la logique pour la réinitialisation du mot de passe
                  print('Mot de passe oublié');
                },
                child: Text('Mot de passe oublié?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Email',
            filled: true,
            fillColor: Color(0xFFe6e6e6),
            prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)
              )
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Mot de passe',
            filled: true,
            fillColor: Color(0xFFe6e6e6),
            prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)
              )
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Ajoutez ici la logique pour la connexion
            print('Connexion en cours...');
            Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>Home()));
          },
          child: Text('Se Connecter'),
        ),
        SizedBox(height: 16.0),
        Text('ou'),
        SizedBox(height: 16.0),
        OutlinedButton(
          onPressed: () {
            // Ajoutez ici la logique pour l'inscription
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationPage()),
            );
            print('Inscription');
          },
          child: Text('S\'inscrire'),
        ),
      ],
    );
  }
}
