import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersFavoritePicturesRecord extends FirestoreRecord {
  UsersFavoritePicturesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UsersFavoritePictures" field.
  String? _usersFavoritePictures;
  String get usersFavoritePictures => _usersFavoritePictures ?? '';
  bool hasUsersFavoritePictures() => _usersFavoritePictures != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "ProductId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "isSwipedRight" field.
  bool? _isSwipedRight;
  bool get isSwipedRight => _isSwipedRight ?? false;
  bool hasIsSwipedRight() => _isSwipedRight != null;

  // "taille" field.
  String? _taille;
  String get taille => _taille ?? '';
  bool hasTaille() => _taille != null;

  // "quality" field.
  String? _quality;
  String get quality => _quality ?? '';
  bool hasQuality() => _quality != null;

  // "prix" field.
  String? _prix;
  String get prix => _prix ?? '';
  bool hasPrix() => _prix != null;

  // "Statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sellerPicture" field.
  String? _sellerPicture;
  String get sellerPicture => _sellerPicture ?? '';
  bool hasSellerPicture() => _sellerPicture != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _usersFavoritePictures = snapshotData['UsersFavoritePictures'] as String?;
    _userId = snapshotData['userId'] as String?;
    _productId = snapshotData['ProductId'] as String?;
    _isSwipedRight = snapshotData['isSwipedRight'] as bool?;
    _taille = snapshotData['taille'] as String?;
    _quality = snapshotData['quality'] as String?;
    _prix = snapshotData['prix'] as String?;
    _statut = snapshotData['Statut'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _sellerPicture = snapshotData['sellerPicture'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UsersFavoritePictures')
          : FirebaseFirestore.instance.collectionGroup('UsersFavoritePictures');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UsersFavoritePictures').doc(id);

  static Stream<UsersFavoritePicturesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UsersFavoritePicturesRecord.fromSnapshot(s));

  static Future<UsersFavoritePicturesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UsersFavoritePicturesRecord.fromSnapshot(s));

  static UsersFavoritePicturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersFavoritePicturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersFavoritePicturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersFavoritePicturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersFavoritePicturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersFavoritePicturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersFavoritePicturesRecordData({
  String? usersFavoritePictures,
  String? userId,
  String? productId,
  bool? isSwipedRight,
  String? taille,
  String? quality,
  String? prix,
  String? statut,
  String? email,
  String? phoneNumber,
  String? name,
  String? sellerPicture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UsersFavoritePictures': usersFavoritePictures,
      'userId': userId,
      'ProductId': productId,
      'isSwipedRight': isSwipedRight,
      'taille': taille,
      'quality': quality,
      'prix': prix,
      'Statut': statut,
      'email': email,
      'phone_number': phoneNumber,
      'name': name,
      'sellerPicture': sellerPicture,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersFavoritePicturesRecordDocumentEquality
    implements Equality<UsersFavoritePicturesRecord> {
  const UsersFavoritePicturesRecordDocumentEquality();

  @override
  bool equals(
      UsersFavoritePicturesRecord? e1, UsersFavoritePicturesRecord? e2) {
    return e1?.usersFavoritePictures == e2?.usersFavoritePictures &&
        e1?.userId == e2?.userId &&
        e1?.productId == e2?.productId &&
        e1?.isSwipedRight == e2?.isSwipedRight &&
        e1?.taille == e2?.taille &&
        e1?.quality == e2?.quality &&
        e1?.prix == e2?.prix &&
        e1?.statut == e2?.statut &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.sellerPicture == e2?.sellerPicture;
  }

  @override
  int hash(UsersFavoritePicturesRecord? e) => const ListEquality().hash([
        e?.usersFavoritePictures,
        e?.userId,
        e?.productId,
        e?.isSwipedRight,
        e?.taille,
        e?.quality,
        e?.prix,
        e?.statut,
        e?.email,
        e?.phoneNumber,
        e?.name,
        e?.sellerPicture
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersFavoritePicturesRecord;
}
