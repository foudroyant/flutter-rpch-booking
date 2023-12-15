import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/cubit/bookcar.cubit.dart';
import 'package:rpch/cubit/bookhotel.cubit.dart';
import 'package:rpch/cubit/hotel.cubit.dart';
import 'package:rpch/screens/Login.dart';
import 'package:rpch/screens/booking.dart';
import 'package:rpch/screens/books.dart';
import 'package:rpch/screens/details.dart';
import 'package:rpch/screens/evenement.dart';
import 'package:rpch/screens/home.dart';
import 'package:rpch/screens/inscription.dart';
import 'package:rpch/screens/logement.dart';
import 'package:rpch/screens/profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>HotelCubit()),
          BlocProvider(create: (context)=>BookingHotel()),
          BlocProvider(create: (context)=>BookingCarCubit())
        ],
        child: MaterialApp(
            title: 'RPCH-Bookin',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a blue toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
            home: AuthPage()
        )
    );
  }
}