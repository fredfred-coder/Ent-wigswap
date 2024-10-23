import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaiementRecord extends FirestoreRecord {
  PaiementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "statuts" field.
  String? _statuts;
  String get statuts => _statuts ?? '';
  bool hasStatuts() => _statuts != null;

  // "paiementId" field.
  String? _paiementId;
  String get paiementId => _paiementId ?? '';
  bool hasPaiementId() => _paiementId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _amount = snapshotData['amount'] as String?;
    _statuts = snapshotData['statuts'] as String?;
    _paiementId = snapshotData['paiementId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _userName = snapshotData['userName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paiement');

  static Stream<PaiementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaiementRecord.fromSnapshot(s));

  static Future<PaiementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaiementRecord.fromSnapshot(s));

  static PaiementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaiementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaiementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaiementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaiementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaiementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaiementRecordData({
  String? userId,
  String? amount,
  String? statuts,
  String? paiementId,
  DateTime? date,
  String? userName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'amount': amount,
      'statuts': statuts,
      'paiementId': paiementId,
      'date': date,
      'userName': userName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaiementRecordDocumentEquality implements Equality<PaiementRecord> {
  const PaiementRecordDocumentEquality();

  @override
  bool equals(PaiementRecord? e1, PaiementRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.amount == e2?.amount &&
        e1?.statuts == e2?.statuts &&
        e1?.paiementId == e2?.paiementId &&
        e1?.date == e2?.date &&
        e1?.userName == e2?.userName;
  }

  @override
  int hash(PaiementRecord? e) => const ListEquality().hash(
      [e?.userId, e?.amount, e?.statuts, e?.paiementId, e?.date, e?.userName]);

  @override
  bool isValidKey(Object? o) => o is PaiementRecord;
}
