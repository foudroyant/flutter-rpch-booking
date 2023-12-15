import 'package:flutter/material.dart';
import 'package:rpch/screens/Login.dart';


class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RegistrationForm(),
        ),
      );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(
              hintText: 'Nom & Prénom',
              filled: true,
              fillColor: Color(0xFFe6e6e6),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
              )
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
                hintText: 'Telephone',
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
                hintText: 'Mot de passe',
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            ),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
                hintText: 'Confirmer le mot de passe',
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            ),
            obscureText: true,
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              // Ajoutez ici la logique pour l'enregistrement
              registerUser();
            },
            child: Text('S\'inscrire'),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              // Naviguer vers la page d'inscription
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthPage()),
              );
            },
            child: Text('Se connecter'),
          ),
        ],
      ),
    );
  }

  void registerUser() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // Ajoutez ici la logique pour l'enregistrement
    // Vous pouvez vérifier la validité des champs et envoyer les données au serveur, par exemple.

    if (password == confirmPassword) {
      print('Enregistrement réussi!');
      print('Prénom: $firstName');
      print('Nom: $lastName');
      print('Email: $email');
      print('Numéro de téléphone: $phoneNumber');
      print('Mot de passe: $password');
    } else {
      print('Les mots de passe ne correspondent pas.');
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationPage(),
    );
  }
}
