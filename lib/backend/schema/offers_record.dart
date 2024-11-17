import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffersRecord extends FirestoreRecord {
  OffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "offerUserId" field.
  String? _offerUserId;
  String get offerUserId => _offerUserId ?? '';
  bool hasOfferUserId() => _offerUserId != null;

  // "offerPrice" field.
  String? _offerPrice;
  String get offerPrice => _offerPrice ?? '';
  bool hasOfferPrice() => _offerPrice != null;

  // "offerDate" field.
  DateTime? _offerDate;
  DateTime? get offerDate => _offerDate;
  bool hasOfferDate() => _offerDate != null;

  // "offerstatus" field.
  String? _offerstatus;
  String get offerstatus => _offerstatus ?? '';
  bool hasOfferstatus() => _offerstatus != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  void _initializeFields() {
    _productId = snapshotData['productId'] as String?;
    _offerUserId = snapshotData['offerUserId'] as String?;
    _offerPrice = snapshotData['offerPrice'] as String?;
    _offerDate = snapshotData['offerDate'] as DateTime?;
    _offerstatus = snapshotData['offerstatus'] as String?;
    _receiverId = snapshotData['receiverId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offers');

  static Stream<OffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffersRecord.fromSnapshot(s));

  static Future<OffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffersRecord.fromSnapshot(s));

  static OffersRecord fromSnapshot(DocumentSnapshot snapshot) => OffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffersRecordData({
  String? productId,
  String? offerUserId,
  String? offerPrice,
  DateTime? offerDate,
  String? offerstatus,
  String? receiverId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productId': productId,
      'offerUserId': offerUserId,
      'offerPrice': offerPrice,
      'offerDate': offerDate,
      'offerstatus': offerstatus,
      'receiverId': receiverId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffersRecordDocumentEquality implements Equality<OffersRecord> {
  const OffersRecordDocumentEquality();

  @override
  bool equals(OffersRecord? e1, OffersRecord? e2) {
    return e1?.productId == e2?.productId &&
        e1?.offerUserId == e2?.offerUserId &&
        e1?.offerPrice == e2?.offerPrice &&
        e1?.offerDate == e2?.offerDate &&
        e1?.offerstatus == e2?.offerstatus &&
        e1?.receiverId == e2?.receiverId;
  }

  @override
  int hash(OffersRecord? e) => const ListEquality().hash([
        e?.productId,
        e?.offerUserId,
        e?.offerPrice,
        e?.offerDate,
        e?.offerstatus,
        e?.receiverId
      ]);

  @override
  bool isValidKey(Object? o) => o is OffersRecord;
}
