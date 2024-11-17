import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  bool hasSellerId() => _sellerId != null;

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  bool hasPhotos() => _photos != null;

  // "statuts" field.
  String? _statuts;
  String get statuts => _statuts ?? '';
  bool hasStatuts() => _statuts != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "quality" field.
  String? _quality;
  String get quality => _quality ?? '';
  bool hasQuality() => _quality != null;

  // "taille" field.
  String? _taille;
  String get taille => _taille ?? '';
  bool hasTaille() => _taille != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "sellerPicture" field.
  String? _sellerPicture;
  String get sellerPicture => _sellerPicture ?? '';
  bool hasSellerPicture() => _sellerPicture != null;

  // "nameUserSeller" field.
  String? _nameUserSeller;
  String get nameUserSeller => _nameUserSeller ?? '';
  bool hasNameUserSeller() => _nameUserSeller != null;

  // "PaysUserProduct" field.
  String? _paysUserProduct;
  String get paysUserProduct => _paysUserProduct ?? '';
  bool hasPaysUserProduct() => _paysUserProduct != null;

  // "CityUserProduct" field.
  String? _cityUserProduct;
  String get cityUserProduct => _cityUserProduct ?? '';
  bool hasCityUserProduct() => _cityUserProduct != null;

  // "docProductId" field.
  String? _docProductId;
  String get docProductId => _docProductId ?? '';
  bool hasDocProductId() => _docProductId != null;

  // "Like" field.
  String? _like;
  String get like => _like ?? '';
  bool hasLike() => _like != null;

  // "Dislike" field.
  String? _dislike;
  String get dislike => _dislike ?? '';
  bool hasDislike() => _dislike != null;

  // "photoPosted" field.
  String? _photoPosted;
  String get photoPosted => _photoPosted ?? '';
  bool hasPhotoPosted() => _photoPosted != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _price = snapshotData['price'] as String?;
    _sellerId = snapshotData['sellerId'] as String?;
    _photos = snapshotData['photos'] as String?;
    _statuts = snapshotData['statuts'] as String?;
    _productId = snapshotData['productId'] as String?;
    _category = snapshotData['category'] as String?;
    _name = snapshotData['name'] as String?;
    _quality = snapshotData['quality'] as String?;
    _taille = snapshotData['taille'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _sellerPicture = snapshotData['sellerPicture'] as String?;
    _nameUserSeller = snapshotData['nameUserSeller'] as String?;
    _paysUserProduct = snapshotData['PaysUserProduct'] as String?;
    _cityUserProduct = snapshotData['CityUserProduct'] as String?;
    _docProductId = snapshotData['docProductId'] as String?;
    _like = snapshotData['Like'] as String?;
    _dislike = snapshotData['Dislike'] as String?;
    _photoPosted = snapshotData['photoPosted'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? description,
  String? price,
  String? sellerId,
  String? photos,
  String? statuts,
  String? productId,
  String? category,
  String? name,
  String? quality,
  String? taille,
  DateTime? date,
  String? sellerPicture,
  String? nameUserSeller,
  String? paysUserProduct,
  String? cityUserProduct,
  String? docProductId,
  String? like,
  String? dislike,
  String? photoPosted,
  String? phoneNumber,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'price': price,
      'sellerId': sellerId,
      'photos': photos,
      'statuts': statuts,
      'productId': productId,
      'category': category,
      'name': name,
      'quality': quality,
      'taille': taille,
      'date': date,
      'sellerPicture': sellerPicture,
      'nameUserSeller': nameUserSeller,
      'PaysUserProduct': paysUserProduct,
      'CityUserProduct': cityUserProduct,
      'docProductId': docProductId,
      'Like': like,
      'Dislike': dislike,
      'photoPosted': photoPosted,
      'phone_number': phoneNumber,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.sellerId == e2?.sellerId &&
        e1?.photos == e2?.photos &&
        e1?.statuts == e2?.statuts &&
        e1?.productId == e2?.productId &&
        e1?.category == e2?.category &&
        e1?.name == e2?.name &&
        e1?.quality == e2?.quality &&
        e1?.taille == e2?.taille &&
        e1?.date == e2?.date &&
        e1?.sellerPicture == e2?.sellerPicture &&
        e1?.nameUserSeller == e2?.nameUserSeller &&
        e1?.paysUserProduct == e2?.paysUserProduct &&
        e1?.cityUserProduct == e2?.cityUserProduct &&
        e1?.docProductId == e2?.docProductId &&
        e1?.like == e2?.like &&
        e1?.dislike == e2?.dislike &&
        e1?.photoPosted == e2?.photoPosted &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.description,
        e?.price,
        e?.sellerId,
        e?.photos,
        e?.statuts,
        e?.productId,
        e?.category,
        e?.name,
        e?.quality,
        e?.taille,
        e?.date,
        e?.sellerPicture,
        e?.nameUserSeller,
        e?.paysUserProduct,
        e?.cityUserProduct,
        e?.docProductId,
        e?.like,
        e?.dislike,
        e?.photoPosted,
        e?.phoneNumber,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
