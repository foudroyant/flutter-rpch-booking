import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "hotel_name" field.
  String? _hotelName;
  String get hotelName => _hotelName ?? '';
  bool hasHotelName() => _hotelName != null;

  // "chambre_name" field.
  String? _chambreName;
  String get chambreName => _chambreName ?? '';
  bool hasChambreName() => _chambreName != null;

  // "montantTotal" field.
  double? _montantTotal;
  double get montantTotal => _montantTotal ?? 0.0;
  bool hasMontantTotal() => _montantTotal != null;

  // "ht" field.
  double? _ht;
  double get ht => _ht ?? 0.0;
  bool hasHt() => _ht != null;

  // "taxe" field.
  double? _taxe;
  double get taxe => _taxe ?? 0.0;
  bool hasTaxe() => _taxe != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  // "methode_payement" field.
  String? _methodePayement;
  String get methodePayement => _methodePayement ?? '';
  bool hasMethodePayement() => _methodePayement != null;

  // "profil" field.
  String? _profil;
  String get profil => _profil ?? '';
  bool hasProfil() => _profil != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _hotelName = snapshotData['hotel_name'] as String?;
    _chambreName = snapshotData['chambre_name'] as String?;
    _montantTotal = castToType<double>(snapshotData['montantTotal']);
    _ht = castToType<double>(snapshotData['ht']);
    _taxe = castToType<double>(snapshotData['taxe']);
    _created = snapshotData['created'] as DateTime?;
    _end = snapshotData['end'] as DateTime?;
    _start = snapshotData['start'] as DateTime?;
    _statut = snapshotData['statut'] as String?;
    _methodePayement = snapshotData['methode_payement'] as String?;
    _profil = snapshotData['profil'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  String? hotelName,
  String? chambreName,
  double? montantTotal,
  double? ht,
  double? taxe,
  DateTime? created,
  DateTime? end,
  DateTime? start,
  String? statut,
  String? methodePayement,
  String? profil,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hotel_name': hotelName,
      'chambre_name': chambreName,
      'montantTotal': montantTotal,
      'ht': ht,
      'taxe': taxe,
      'created': created,
      'end': end,
      'start': start,
      'statut': statut,
      'methode_payement': methodePayement,
      'profil': profil,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.hotelName == e2?.hotelName &&
        e1?.chambreName == e2?.chambreName &&
        e1?.montantTotal == e2?.montantTotal &&
        e1?.ht == e2?.ht &&
        e1?.taxe == e2?.taxe &&
        e1?.created == e2?.created &&
        e1?.end == e2?.end &&
        e1?.start == e2?.start &&
        e1?.statut == e2?.statut &&
        e1?.methodePayement == e2?.methodePayement &&
        e1?.profil == e2?.profil &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.hotelName,
        e?.chambreName,
        e?.montantTotal,
        e?.ht,
        e?.taxe,
        e?.created,
        e?.end,
        e?.start,
        e?.statut,
        e?.methodePayement,
        e?.profil,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
