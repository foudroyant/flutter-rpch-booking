import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/providers/chambre.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/administration_hotels.dart';
import 'package:rpchbooking/screens/authentification.dart';
import 'package:rpchbooking/screens/books.dart';
import 'package:rpchbooking/screens/details_chambre.dart';
import 'package:rpchbooking/screens/details_hotel.dart';
import 'package:rpchbooking/screens/home.dart';
import 'package:rpchbooking/screens/preview_book.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //if (firebasekDebugMode) {
    /*try {
      FirebaseFirestore.instance.useFirestoreEmulator('http://192.168.43.163', 8080);
      await FirebaseAuth.instance.useAuthEmulator('http://192.168.43.163', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }*/
  //}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelProvider(),),
        ChangeNotifierProvider(create: (context) => ChambreProvider(),),
        ChangeNotifierProvider(create: (context) => ReservationProvider(),),
      ],
      child: MaterialApp(
        title: 'RPCH',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: AppBarTheme(
              //backgroundColor: Theme.of(context).colorScheme.primaryContainer
          ),
          useMaterial3: true,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {

  final db = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: "731810484924-23amrauegadd58rkcbthebjm860plmb6.apps.googleusercontent.com"),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("RPCH-Booking")
                  ],
                ),
              );
            },

            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to RPCH-Booking, please sign in!')
                    : const Text('Welcome to RPCH-Booking, please sign up!'),
              );
            },

            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        }

        return Home();
      },
    );
  }
}
