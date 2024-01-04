import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _dateDebut;
  DateTime? get dateDebut => _dateDebut;
  set dateDebut(DateTime? value) {
    _dateDebut = value;
  }

  DateTime? _dateFin;
  DateTime? get dateFin => _dateFin;
  set dateFin(DateTime? value) {
    _dateFin = value;
  }

  String _hotelCourant = '';
  String get hotelCourant => _hotelCourant;
  set hotelCourant(String value) {
    _hotelCourant = value;
  }

  String _chambreCourant = '';
  String get chambreCourant => _chambreCourant;
  set chambreCourant(String value) {
    _chambreCourant = value;
  }

  DocumentReference? _refHotelCourant;
  DocumentReference? get refHotelCourant => _refHotelCourant;
  set refHotelCourant(DocumentReference? value) {
    _refHotelCourant = value;
  }

  DocumentReference? _refChambreCourant;
  DocumentReference? get refChambreCourant => _refChambreCourant;
  set refChambreCourant(DocumentReference? value) {
    _refChambreCourant = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
