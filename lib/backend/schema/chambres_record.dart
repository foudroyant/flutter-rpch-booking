import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChambresRecord extends FirestoreRecord {
  ChambresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "capacite" field.
  int? _capacite;
  int get capacite => _capacite ?? 0;
  bool hasCapacite() => _capacite != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "equipements" field.
  List<String>? _equipements;
  List<String> get equipements => _equipements ?? const [];
  bool hasEquipements() => _equipements != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  bool hasDisponible() => _disponible != null;

  // "hotel" field.
  String? _hotel;
  String get hotel => _hotel ?? '';
  bool hasHotel() => _hotel != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _prix = castToType<double>(snapshotData['prix']);
    _image = snapshotData['image'] as String?;
    _images = getDataList(snapshotData['images']);
    _capacite = castToType<int>(snapshotData['capacite']);
    _services = getDataList(snapshotData['services']);
    _equipements = getDataList(snapshotData['equipements']);
    _disponible = snapshotData['disponible'] as bool?;
    _hotel = snapshotData['hotel'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chambres');

  static Stream<ChambresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChambresRecord.fromSnapshot(s));

  static Future<ChambresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChambresRecord.fromSnapshot(s));

  static ChambresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChambresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChambresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChambresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChambresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChambresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChambresRecordData({
  String? type,
  double? prix,
  String? image,
  int? capacite,
  bool? disponible,
  String? hotel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'prix': prix,
      'image': image,
      'capacite': capacite,
      'disponible': disponible,
      'hotel': hotel,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChambresRecordDocumentEquality implements Equality<ChambresRecord> {
  const ChambresRecordDocumentEquality();

  @override
  bool equals(ChambresRecord? e1, ChambresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.prix == e2?.prix &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.capacite == e2?.capacite &&
        listEquality.equals(e1?.services, e2?.services) &&
        listEquality.equals(e1?.equipements, e2?.equipements) &&
        e1?.disponible == e2?.disponible &&
        e1?.hotel == e2?.hotel;
  }

  @override
  int hash(ChambresRecord? e) => const ListEquality().hash([
        e?.type,
        e?.prix,
        e?.image,
        e?.images,
        e?.capacite,
        e?.services,
        e?.equipements,
        e?.disponible,
        e?.hotel
      ]);

  @override
  bool isValidKey(Object? o) => o is ChambresRecord;
}
