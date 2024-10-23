import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReceivedOffersRecord extends FirestoreRecord {
  ReceivedOffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "PriceReceived" field.
  String? _priceReceived;
  String get priceReceived => _priceReceived ?? '';
  bool hasPriceReceived() => _priceReceived != null;

  // "dateReceived" field.
  DateTime? _dateReceived;
  DateTime? get dateReceived => _dateReceived;
  bool hasDateReceived() => _dateReceived != null;

  // "nameReceived" field.
  String? _nameReceived;
  String get nameReceived => _nameReceived ?? '';
  bool hasNameReceived() => _nameReceived != null;

  // "receivedId" field.
  String? _receivedId;
  String get receivedId => _receivedId ?? '';
  bool hasReceivedId() => _receivedId != null;

  // "idUserReceived" field.
  String? _idUserReceived;
  String get idUserReceived => _idUserReceived ?? '';
  bool hasIdUserReceived() => _idUserReceived != null;

  // "sentOfferId" field.
  String? _sentOfferId;
  String get sentOfferId => _sentOfferId ?? '';
  bool hasSentOfferId() => _sentOfferId != null;

  // "StatutReceivedOffers" field.
  DocumentReference? _statutReceivedOffers;
  DocumentReference? get statutReceivedOffers => _statutReceivedOffers;
  bool hasStatutReceivedOffers() => _statutReceivedOffers != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productId = snapshotData['productId'] as String?;
    _priceReceived = snapshotData['PriceReceived'] as String?;
    _dateReceived = snapshotData['dateReceived'] as DateTime?;
    _nameReceived = snapshotData['nameReceived'] as String?;
    _receivedId = snapshotData['receivedId'] as String?;
    _idUserReceived = snapshotData['idUserReceived'] as String?;
    _sentOfferId = snapshotData['sentOfferId'] as String?;
    _statutReceivedOffers =
        snapshotData['StatutReceivedOffers'] as DocumentReference?;
    _sellerId = snapshotData['sellerId'] as String?;
    _docProductId = snapshotData['docProductId'] as String?;
    _pictureProduct = snapshotData['pictureProduct'] as String?;
    _pricePerruque = snapshotData['pricePerruque'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _pictureUserOffert = snapshotData['pictureUserOffert'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('receivedOffers')
          : FirebaseFirestore.instance.collectionGroup('receivedOffers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('receivedOffers').doc(id);

  static Stream<ReceivedOffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReceivedOffersRecord.fromSnapshot(s));

  static Future<ReceivedOffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReceivedOffersRecord.fromSnapshot(s));

  static ReceivedOffersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReceivedOffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReceivedOffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReceivedOffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReceivedOffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReceivedOffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReceivedOffersRecordData({
  String? productId,
  String? priceReceived,
  DateTime? dateReceived,
  String? nameReceived,
  String? receivedId,
  String? idUserReceived,
  String? sentOfferId,
  DocumentReference? statutReceivedOffers,
  String? sellerId,
  String? docProductId,
  String? pictureProduct,
  String? pricePerruque,
  String? email,
  String? phoneNumber,
  String? pictureUserOffert,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productId': productId,
      'PriceReceived': priceReceived,
      'dateReceived': dateReceived,
      'nameReceived': nameReceived,
      'receivedId': receivedId,
      'idUserReceived': idUserReceived,
      'sentOfferId': sentOfferId,
      'StatutReceivedOffers': statutReceivedOffers,
      'sellerId': sellerId,
      'docProductId': docProductId,
      'pictureProduct': pictureProduct,
      'pricePerruque': pricePerruque,
      'email': email,
      'phone_number': phoneNumber,
      'pictureUserOffert': pictureUserOffert,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReceivedOffersRecordDocumentEquality
    implements Equality<ReceivedOffersRecord> {
  const ReceivedOffersRecordDocumentEquality();

  @override
  bool equals(ReceivedOffersRecord? e1, ReceivedOffersRecord? e2) {
    return e1?.productId == e2?.productId &&
        e1?.priceReceived == e2?.priceReceived &&
        e1?.dateReceived == e2?.dateReceived &&
        e1?.nameReceived == e2?.nameReceived &&
        e1?.receivedId == e2?.receivedId &&
        e1?.idUserReceived == e2?.idUserReceived &&
        e1?.sentOfferId == e2?.sentOfferId &&
        e1?.statutReceivedOffers == e2?.statutReceivedOffers &&
        e1?.sellerId == e2?.sellerId &&
        e1?.docProductId == e2?.docProductId &&
        e1?.pictureProduct == e2?.pictureProduct &&
        e1?.pricePerruque == e2?.pricePerruque &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.pictureUserOffert == e2?.pictureUserOffert;
  }

  @override
  int hash(ReceivedOffersRecord? e) => const ListEquality().hash([
        e?.productId,
        e?.priceReceived,
        e?.dateReceived,
        e?.nameReceived,
        e?.receivedId,
        e?.idUserReceived,
        e?.sentOfferId,
        e?.statutReceivedOffers,
        e?.sellerId,
        e?.docProductId,
        e?.pictureProduct,
        e?.pricePerruque,
        e?.email,
        e?.phoneNumber,
        e?.pictureUserOffert
      ]);

  @override
  bool isValidKey(Object? o) => o is ReceivedOffersRecord;
}
