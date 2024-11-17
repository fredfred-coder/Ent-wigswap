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

  // "paiementId" field.
  String? _paiementId;
  String get paiementId => _paiementId ?? '';
  bool hasPaiementId() => _paiementId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "dateTime" field.
  String? _dateTime;
  String get dateTime => _dateTime ?? '';
  bool hasDateTime() => _dateTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _paiementId = snapshotData['paiementId'] as String?;
    _userName = snapshotData['userName'] as String?;
    _status = snapshotData['status'] as String?;
    _amount = snapshotData['amount'] as String?;
    _dateTime = snapshotData['dateTime'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
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
  String? paiementId,
  String? userName,
  String? status,
  String? amount,
  String? dateTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'paiementId': paiementId,
      'userName': userName,
      'status': status,
      'amount': amount,
      'dateTime': dateTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaiementRecordDocumentEquality implements Equality<PaiementRecord> {
  const PaiementRecordDocumentEquality();

  @override
  bool equals(PaiementRecord? e1, PaiementRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.paiementId == e2?.paiementId &&
        e1?.userName == e2?.userName &&
        e1?.status == e2?.status &&
        e1?.amount == e2?.amount &&
        e1?.dateTime == e2?.dateTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(PaiementRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.paiementId,
        e?.userName,
        e?.status,
        e?.amount,
        e?.dateTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is PaiementRecord;
}
