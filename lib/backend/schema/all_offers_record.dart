import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllOffersRecord extends FirestoreRecord {
  AllOffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "receivedId" field.
  String? _receivedId;
  String get receivedId => _receivedId ?? '';
  bool hasReceivedId() => _receivedId != null;

  // "offerName" field.
  String? _offerName;
  String get offerName => _offerName ?? '';
  bool hasOfferName() => _offerName != null;

  // "NouvelleOffre" field.
  String? _nouvelleOffre;
  String get nouvelleOffre => _nouvelleOffre ?? '';
  bool hasNouvelleOffre() => _nouvelleOffre != null;

  // "sentOfferId" field.
  String? _sentOfferId;
  String get sentOfferId => _sentOfferId ?? '';
  bool hasSentOfferId() => _sentOfferId != null;

  // "PriceReceived" field.
  String? _priceReceived;
  String get priceReceived => _priceReceived ?? '';
  bool hasPriceReceived() => _priceReceived != null;

  // "dateReceived" field.
  DateTime? _dateReceived;
  DateTime? get dateReceived => _dateReceived;
  bool hasDateReceived() => _dateReceived != null;

  // "idUserReceived" field.
  String? _idUserReceived;
  String get idUserReceived => _idUserReceived ?? '';
  bool hasIdUserReceived() => _idUserReceived != null;

  // "receivedStatut" field.
  String? _receivedStatut;
  String get receivedStatut => _receivedStatut ?? '';
  bool hasReceivedStatut() => _receivedStatut != null;

  // "statutReceivedOffer" field.
  String? _statutReceivedOffer;
  String get statutReceivedOffer => _statutReceivedOffer ?? '';
  bool hasStatutReceivedOffer() => _statutReceivedOffer != null;

  void _initializeFields() {
    _offerUserId = snapshotData['offerUserId'] as String?;
    _offerPrice = snapshotData['offerPrice'] as String?;
    _offerDate = snapshotData['offerDate'] as DateTime?;
    _productId = snapshotData['productId'] as String?;
    _receivedId = snapshotData['receivedId'] as String?;
    _offerName = snapshotData['offerName'] as String?;
    _nouvelleOffre = snapshotData['NouvelleOffre'] as String?;
    _sentOfferId = snapshotData['sentOfferId'] as String?;
    _priceReceived = snapshotData['PriceReceived'] as String?;
    _dateReceived = snapshotData['dateReceived'] as DateTime?;
    _idUserReceived = snapshotData['idUserReceived'] as String?;
    _receivedStatut = snapshotData['receivedStatut'] as String?;
    _statutReceivedOffer = snapshotData['statutReceivedOffer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allOffers');

  static Stream<AllOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllOffersRecord.fromSnapshot(s));

  static Future<AllOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllOffersRecord.fromSnapshot(s));

  static AllOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllOffersRecordData({
  String? offerUserId,
  String? offerPrice,
  DateTime? offerDate,
  String? productId,
  String? receivedId,
  String? offerName,
  String? nouvelleOffre,
  String? sentOfferId,
  String? priceReceived,
  DateTime? dateReceived,
  String? idUserReceived,
  String? receivedStatut,
  String? statutReceivedOffer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offerUserId': offerUserId,
      'offerPrice': offerPrice,
      'offerDate': offerDate,
      'productId': productId,
      'receivedId': receivedId,
      'offerName': offerName,
      'NouvelleOffre': nouvelleOffre,
      'sentOfferId': sentOfferId,
      'PriceReceived': priceReceived,
      'dateReceived': dateReceived,
      'idUserReceived': idUserReceived,
      'receivedStatut': receivedStatut,
      'statutReceivedOffer': statutReceivedOffer,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllOffersRecordDocumentEquality implements Equality<AllOffersRecord> {
  const AllOffersRecordDocumentEquality();

  @override
  bool equals(AllOffersRecord? e1, AllOffersRecord? e2) {
    return e1?.offerUserId == e2?.offerUserId &&
        e1?.offerPrice == e2?.offerPrice &&
        e1?.offerDate == e2?.offerDate &&
        e1?.productId == e2?.productId &&
        e1?.receivedId == e2?.receivedId &&
        e1?.offerName == e2?.offerName &&
        e1?.nouvelleOffre == e2?.nouvelleOffre &&
        e1?.sentOfferId == e2?.sentOfferId &&
        e1?.priceReceived == e2?.priceReceived &&
        e1?.dateReceived == e2?.dateReceived &&
        e1?.idUserReceived == e2?.idUserReceived &&
        e1?.receivedStatut == e2?.receivedStatut &&
        e1?.statutReceivedOffer == e2?.statutReceivedOffer;
  }

  @override
  int hash(AllOffersRecord? e) => const ListEquality().hash([
        e?.offerUserId,
        e?.offerPrice,
        e?.offerDate,
        e?.productId,
        e?.receivedId,
        e?.offerName,
        e?.nouvelleOffre,
        e?.sentOfferId,
        e?.priceReceived,
        e?.dateReceived,
        e?.idUserReceived,
        e?.receivedStatut,
        e?.statutReceivedOffer
      ]);

  @override
  bool isValidKey(Object? o) => o is AllOffersRecord;
}
