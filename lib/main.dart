import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:rpchbooking/providers/chambre.dart';
import 'package:rpchbooking/providers/hotel.dart';
import 'package:rpchbooking/providers/reservation.dart';
import 'package:rpchbooking/screens/Onboarding.dart';
import 'package:rpchbooking/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';


void main() async{

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;

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

  runApp(MyApp(onboarding: onboarding,));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding=false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelProvider(),),
        ChangeNotifierProvider(create: (context) => ChambreProvider(),),
        ChangeNotifierProvider(create: (context) => ReservationProvider(),),
      ],
      child: MaterialApp(
        title: 'RPCH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: AppBarTheme(
              //backgroundColor: Theme.of(context).colorScheme.primaryContainer
          ),
          useMaterial3: true,
        ),
        home: onboarding ? AuthenticationWrapper() : Onboarding() //AuthenticationWrapper(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("RPCH-BOOKING", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),)
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
