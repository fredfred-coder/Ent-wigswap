import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhotosProductRecord extends FirestoreRecord {
  PhotosProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photos_url" field.
  String? _photosUrl;
  String get photosUrl => _photosUrl ?? '';
  bool hasPhotosUrl() => _photosUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "sellerId" field.
  String? _sellerId;
  String get sellerId => _sellerId ?? '';
  bool hasSellerId() => _sellerId != null;

  // "Like" field.
  String? _like;
  String get like => _like ?? '';
  bool hasLike() => _like != null;

  // "Dislike" field.
  String? _dislike;
  String get dislike => _dislike ?? '';
  bool hasDislike() => _dislike != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _photosUrl = snapshotData['photos_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _productId = snapshotData['productId'] as String?;
    _sellerId = snapshotData['sellerId'] as String?;
    _like = snapshotData['Like'] as String?;
    _dislike = snapshotData['Dislike'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('photosProduct')
          : FirebaseFirestore.instance.collectionGroup('photosProduct');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('photosProduct').doc(id);

  static Stream<PhotosProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosProductRecord.fromSnapshot(s));

  static Future<PhotosProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosProductRecord.fromSnapshot(s));

  static PhotosProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PhotosProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosProductRecordData({
  String? photosUrl,
  DateTime? createdTime,
  String? productId,
  String? sellerId,
  String? like,
  String? dislike,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photos_url': photosUrl,
      'created_time': createdTime,
      'productId': productId,
      'sellerId': sellerId,
      'Like': like,
      'Dislike': dislike,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosProductRecordDocumentEquality
    implements Equality<PhotosProductRecord> {
  const PhotosProductRecordDocumentEquality();

  @override
  bool equals(PhotosProductRecord? e1, PhotosProductRecord? e2) {
    return e1?.photosUrl == e2?.photosUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.productId == e2?.productId &&
        e1?.sellerId == e2?.sellerId &&
        e1?.like == e2?.like &&
        e1?.dislike == e2?.dislike;
  }

  @override
  int hash(PhotosProductRecord? e) => const ListEquality().hash([
        e?.photosUrl,
        e?.createdTime,
        e?.productId,
        e?.sellerId,
        e?.like,
        e?.dislike
      ]);

  @override
  bool isValidKey(Object? o) => o is PhotosProductRecord;
}
