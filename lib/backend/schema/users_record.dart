import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "profilePhoto" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "dateOf_Birthday" field.
  String? _dateOfBirthday;
  String get dateOfBirthday => _dateOfBirthday ?? '';
  bool hasDateOfBirthday() => _dateOfBirthday != null;

  // "profilRef" field.
  DocumentReference? _profilRef;
  DocumentReference? get profilRef => _profilRef;
  bool hasProfilRef() => _profilRef != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "Enattentedecision" field.
  String? _enattentedecision;
  String get enattentedecision => _enattentedecision ?? '';
  bool hasEnattentedecision() => _enattentedecision != null;

  // "isSwipedRight" field.
  bool? _isSwipedRight;
  bool get isSwipedRight => _isSwipedRight ?? false;
  bool hasIsSwipedRight() => _isSwipedRight != null;

  // "paymentStatut" field.
  bool? _paymentStatut;
  bool get paymentStatut => _paymentStatut ?? false;
  bool hasPaymentStatut() => _paymentStatut != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _profilePhoto = snapshotData['profilePhoto'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _language = snapshotData['language'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _dateOfBirthday = snapshotData['dateOf_Birthday'] as String?;
    _profilRef = snapshotData['profilRef'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _enattentedecision = snapshotData['Enattentedecision'] as String?;
    _isSwipedRight = snapshotData['isSwipedRight'] as bool?;
    _paymentStatut = snapshotData['paymentStatut'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? name,
  String? email,
  String? profilePhoto,
  DateTime? createdAt,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? language,
  String? phoneNumber,
  String? dateOfBirthday,
  DocumentReference? profilRef,
  String? city,
  String? country,
  String? enattentedecision,
  bool? isSwipedRight,
  bool? paymentStatut,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'profilePhoto': profilePhoto,
      'createdAt': createdAt,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'language': language,
      'phone_number': phoneNumber,
      'dateOf_Birthday': dateOfBirthday,
      'profilRef': profilRef,
      'city': city,
      'country': country,
      'Enattentedecision': enattentedecision,
      'isSwipedRight': isSwipedRight,
      'paymentStatut': paymentStatut,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.profilePhoto == e2?.profilePhoto &&
        e1?.createdAt == e2?.createdAt &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.language == e2?.language &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.dateOfBirthday == e2?.dateOfBirthday &&
        e1?.profilRef == e2?.profilRef &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.enattentedecision == e2?.enattentedecision &&
        e1?.isSwipedRight == e2?.isSwipedRight &&
        e1?.paymentStatut == e2?.paymentStatut;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.profilePhoto,
        e?.createdAt,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.language,
        e?.phoneNumber,
        e?.dateOfBirthday,
        e?.profilRef,
        e?.city,
        e?.country,
        e?.enattentedecision,
        e?.isSwipedRight,
        e?.paymentStatut
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
