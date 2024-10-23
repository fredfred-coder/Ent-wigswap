import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotoPostedRecord extends FirestoreRecord {
  PhotoPostedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "paymentsStatus" field.
  bool? _paymentsStatus;
  bool get paymentsStatus => _paymentsStatus ?? false;
  bool hasPaymentsStatus() => _paymentsStatus != null;

  // "paymentAmount" field.
  String? _paymentAmount;
  String get paymentAmount => _paymentAmount ?? '';
  bool hasPaymentAmount() => _paymentAmount != null;

  // "paymentDate" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _photoUrl = snapshotData['photoUrl'] as String?;
    _paymentsStatus = snapshotData['paymentsStatus'] as bool?;
    _paymentAmount = snapshotData['paymentAmount'] as String?;
    _paymentDate = snapshotData['paymentDate'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('photoPosted')
          : FirebaseFirestore.instance.collectionGroup('photoPosted');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('photoPosted').doc(id);

  static Stream<PhotoPostedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotoPostedRecord.fromSnapshot(s));

  static Future<PhotoPostedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotoPostedRecord.fromSnapshot(s));

  static PhotoPostedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PhotoPostedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotoPostedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotoPostedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotoPostedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotoPostedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotoPostedRecordData({
  String? photoUrl,
  bool? paymentsStatus,
  String? paymentAmount,
  DateTime? paymentDate,
  String? email,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photoUrl': photoUrl,
      'paymentsStatus': paymentsStatus,
      'paymentAmount': paymentAmount,
      'paymentDate': paymentDate,
      'email': email,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotoPostedRecordDocumentEquality implements Equality<PhotoPostedRecord> {
  const PhotoPostedRecordDocumentEquality();

  @override
  bool equals(PhotoPostedRecord? e1, PhotoPostedRecord? e2) {
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.paymentsStatus == e2?.paymentsStatus &&
        e1?.paymentAmount == e2?.paymentAmount &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(PhotoPostedRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.paymentsStatus,
        e?.paymentAmount,
        e?.paymentDate,
        e?.email,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is PhotoPostedRecord;
}
