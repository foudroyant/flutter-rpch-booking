import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpch/utils/data.dart';
import 'package:rpch/utils/models.dart';

class BookingHotel extends Cubit<BookHotelModel>{
  BookingHotel() : super(initBookHotel);

  setDate(DateTime start, DateTime end){
    state.setDate(start, end);
  }

  setMontant(int montant){
    state.montantTotal = montant;
  }

  setProfil(int profil){
    state.profil = profil;
  }

  setInfoPayement(String infos){state.infoPayement = infos;}
  setStatut(String statut){state.statut = statut;}
  setHotelAndRom(int hotel, int room){
    state.hotel = hotel;
    state.chambre = room;
  }
}