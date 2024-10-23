import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SentOffersRecord extends FirestoreRecord {
  SentOffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "offerUserID" field.
  String? _offerUserID;
  String get offerUserID => _offerUserID ?? '';
  bool hasOfferUserID() => _offerUserID != null;

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

  // "offerName" field.
  String? _offerName;
  String get offerName => _offerName ?? '';
  bool hasOfferName() => _offerName != null;

  // "NouvelleOffre" field.
  String? _nouvelleOffre;
  String get nouvelleOffre => _nouvelleOffre ?? '';
  bool hasNouvelleOffre() => _nouvelleOffre != null;

  // "receivedId" field.
  String? _receivedId;
  String get receivedId => _receivedId ?? '';
  bool hasReceivedId() => _receivedId != null;

  // "sentOffersId" field.
  String? _sentOffersId;
  String get sentOffersId => _sentOffersId ?? '';
  bool hasSentOffersId() => _sentOffersId != null;

  // "docSentId" field.
  String? _docSentId;
  String get docSentId => _docSentId ?? '';
  bool hasDocSentId() => _docSentId != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  bool hasSellerId() => _sellerId != null;

  // "docProductId" field.
  String? _docProductId;
  String get docProductId => _docProductId ?? '';
  bool hasDocProductId() => _docProductId != null;

  // "pictureProduct" field.
  String? _pictureProduct;
  String get pictureProduct => _pictureProduct ?? '';
  bool hasPictureProduct() => _pictureProduct != null;

  // "pricePerruque" field.
  String? _pricePerruque;
  String get pricePerruque => _pricePerruque ?? '';
  bool hasPricePerruque() => _pricePerruque != null;

  // "statutOffersReceived" field.
  String? _statutOffersReceived;
  String get statutOffersReceived => _statutOffersReceived ?? '';
  bool hasStatutOffersReceived() => _statutOffersReceived != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "statutOfferSent" field.
  String? _statutOfferSent;
  String get statutOfferSent => _statutOfferSent ?? '';
  bool hasStatutOfferSent() => _statutOfferSent != null;

  // "StatutOffersReceived2" field.
  String? _statutOffersReceived2;
  String get statutOffersReceived2 => _statutOffersReceived2 ?? '';
  bool hasStatutOffersReceived2() => _statutOffersReceived2 != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "pictureUserOffert" field.
  String? _pictureUserOffert;
  String get pictureUserOffert => _pictureUserOffert ?? '';
  bool hasPictureUserOffert() => _pictureUserOffert != null;

  // "emailSeller" field.
  String? _emailSeller;
  String get emailSeller => _emailSeller ?? '';
  bool hasEmailSeller() => _emailSeller != null;

  // "phoneNumberSeller" field.
  String? _phoneNumberSeller;
  String get phoneNumberSeller => _phoneNumberSeller ?? '';
  bool hasPhoneNumberSeller() => _phoneNumberSeller != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _offerUserID = snapshotData['offerUserID'] as String?;
    _offerPrice = snapshotData['offerPrice'] as String?;
    _offerDate = snapshotData['offerDate'] as DateTime?;
    _productId = snapshotData['productId'] as String?;
    _offerName = snapshotData['offerName'] as String?;
    _nouvelleOffre = snapshotData['NouvelleOffre'] as String?;
    _receivedId = snapshotData['receivedId'] as String?;
    _sentOffersId = snapshotData['sentOffersId'] as String?;
    _docSentId = snapshotData['docSentId'] as String?;
    _sellerId = snapshotData['sellerId'] as String?;
    _docProductId = snapshotData['docProductId'] as String?;
    _pictureProduct = snapshotData['pictureProduct'] as String?;
    _pricePerruque = snapshotData['pricePerruque'] as String?;
    _statutOffersReceived = snapshotData['statutOffersReceived'] as String?;
    _name = snapshotData['name'] as String?;
    _statutOfferSent = snapshotData['statutOfferSent'] as String?;
    _statutOffersReceived2 = snapshotData['StatutOffersReceived2'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _pictureUserOffert = snapshotData['pictureUserOffert'] as String?;
    _emailSeller = snapshotData['emailSeller'] as String?;
    _phoneNumberSeller = snapshotData['phoneNumberSeller'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sentOffers')
          : FirebaseFirestore.instance.collectionGroup('sentOffers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sentOffers').doc(id);

  static Stream<SentOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SentOffersRecord.fromSnapshot(s));

  static Future<SentOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SentOffersRecord.fromSnapshot(s));

  static SentOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SentOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SentOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SentOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SentOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SentOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSentOffersRecordData({
  String? offerUserID,
  String? offerPrice,
  DateTime? offerDate,
  String? productId,
  String? offerName,
  String? nouvelleOffre,
  String? receivedId,
  String? sentOffersId,
  String? docSentId,
  String? sellerId,
  String? docProductId,
  String? pictureProduct,
  String? pricePerruque,
  String? statutOffersReceived,
  String? name,
  String? statutOfferSent,
  String? statutOffersReceived2,
  String? email,
  String? phoneNumber,
  String? pictureUserOffert,
  String? emailSeller,
  String? phoneNumberSeller,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offerUserID': offerUserID,
      'offerPrice': offerPrice,
      'offerDate': offerDate,
      'productId': productId,
      'offerName': offerName,
      'NouvelleOffre': nouvelleOffre,
      'receivedId': receivedId,
      'sentOffersId': sentOffersId,
      'docSentId': docSentId,
      'sellerId': sellerId,
      'docProductId': docProductId,
      'pictureProduct': pictureProduct,
      'pricePerruque': pricePerruque,
      'statutOffersReceived': statutOffersReceived,
      'name': name,
      'statutOfferSent': statutOfferSent,
      'StatutOffersReceived2': statutOffersReceived2,
      'email': email,
      'phone_number': phoneNumber,
      'pictureUserOffert': pictureUserOffert,
      'emailSeller': emailSeller,
      'phoneNumberSeller': phoneNumberSeller,
    }.withoutNulls,
  );

  return firestoreData;
}

class SentOffersRecordDocumentEquality implements Equality<SentOffersRecord> {
  const SentOffersRecordDocumentEquality();

  @override
  bool equals(SentOffersRecord? e1, SentOffersRecord? e2) {
    return e1?.offerUserID == e2?.offerUserID &&
        e1?.offerPrice == e2?.offerPrice &&
        e1?.offerDate == e2?.offerDate &&
        e1?.productId == e2?.productId &&
        e1?.offerName == e2?.offerName &&
        e1?.nouvelleOffre == e2?.nouvelleOffre &&
        e1?.receivedId == e2?.receivedId &&
        e1?.sentOffersId == e2?.sentOffersId &&
        e1?.docSentId == e2?.docSentId &&
        e1?.sellerId == e2?.sellerId &&
        e1?.docProductId == e2?.docProductId &&
        e1?.pictureProduct == e2?.pictureProduct &&
        e1?.pricePerruque == e2?.pricePerruque &&
        e1?.statutOffersReceived == e2?.statutOffersReceived &&
        e1?.name == e2?.name &&
        e1?.statutOfferSent == e2?.statutOfferSent &&
        e1?.statutOffersReceived2 == e2?.statutOffersReceived2 &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.pictureUserOffert == e2?.pictureUserOffert &&
        e1?.emailSeller == e2?.emailSeller &&
        e1?.phoneNumberSeller == e2?.phoneNumberSeller;
  }

  @override
  int hash(SentOffersRecord? e) => const ListEquality().hash([
        e?.offerUserID,
        e?.offerPrice,
        e?.offerDate,
        e?.productId,
        e?.offerName,
        e?.nouvelleOffre,
        e?.receivedId,
        e?.sentOffersId,
        e?.docSentId,
        e?.sellerId,
        e?.docProductId,
        e?.pictureProduct,
        e?.pricePerruque,
        e?.statutOffersReceived,
        e?.name,
        e?.statutOfferSent,
        e?.statutOffersReceived2,
        e?.email,
        e?.phoneNumber,
        e?.pictureUserOffert,
        e?.emailSeller,
        e?.phoneNumberSeller
      ]);

  @override
  bool isValidKey(Object? o) => o is SentOffersRecord;
}
