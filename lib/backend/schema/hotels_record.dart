import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelsRecord extends FirestoreRecord {
  HotelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "localisation" field.
  String? _localisation;
  String get localisation => _localisation ?? '';
  bool hasLocalisation() => _localisation != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "telephone" field.
  String? _telephone;
  String get telephone => _telephone ?? '';
  bool hasTelephone() => _telephone != null;

  // "prixMoyen" field.
  double? _prixMoyen;
  double get prixMoyen => _prixMoyen ?? 0.0;
  bool hasPrixMoyen() => _prixMoyen != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "equipements" field.
  List<String>? _equipements;
  List<String> get equipements => _equipements ?? const [];
  bool hasEquipements() => _equipements != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _localisation = snapshotData['localisation'] as String?;
    _description = snapshotData['description'] as String?;
    _telephone = snapshotData['telephone'] as String?;
    _prixMoyen = castToType<double>(snapshotData['prixMoyen']);
    _image = snapshotData['image'] as String?;
    _images = getDataList(snapshotData['images']);
    _services = getDataList(snapshotData['services']);
    _equipements = getDataList(snapshotData['equipements']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hotels');

  static Stream<HotelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HotelsRecord.fromSnapshot(s));

  static Future<HotelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HotelsRecord.fromSnapshot(s));

  static HotelsRecord fromSnapshot(DocumentSnapshot snapshot) => HotelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HotelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HotelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HotelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HotelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHotelsRecordData({
  String? nom,
  String? localisation,
  String? description,
  String? telephone,
  double? prixMoyen,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'localisation': localisation,
      'description': description,
      'telephone': telephone,
      'prixMoyen': prixMoyen,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class HotelsRecordDocumentEquality implements Equality<HotelsRecord> {
  const HotelsRecordDocumentEquality();

  @override
  bool equals(HotelsRecord? e1, HotelsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nom == e2?.nom &&
        e1?.localisation == e2?.localisation &&
        e1?.description == e2?.description &&
        e1?.telephone == e2?.telephone &&
        e1?.prixMoyen == e2?.prixMoyen &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.services, e2?.services) &&
        listEquality.equals(e1?.equipements, e2?.equipements);
  }

  @override
  int hash(HotelsRecord? e) => const ListEquality().hash([
        e?.nom,
        e?.localisation,
        e?.description,
        e?.telephone,
        e?.prixMoyen,
        e?.image,
        e?.images,
        e?.services,
        e?.equipements
      ]);

  @override
  bool isValidKey(Object? o) => o is HotelsRecord;
}
