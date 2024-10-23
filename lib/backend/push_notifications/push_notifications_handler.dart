import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Profil': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'photosProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photosProductRef', PhotosProductRecord.fromSnapshot),
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'receivedOffersRef': await getDocumentParameter<ReceivedOffersRecord>(
              data, 'receivedOffersRef', ReceivedOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'Profile08': ParameterData.none(),
  'CreateIdUsers': ParameterData.none(),
  'auth_2_Create': ParameterData.none(),
  'auth_2_Login': ParameterData.none(),
  'auth_2_ForgotPassword': ParameterData.none(),
  'auth_2_createProfile': ParameterData.none(),
  'auth_2_Profile': ParameterData.none(),
  'auth_2_EditProfile': ParameterData.none(),
  'Gallerie_Perruques': (data) async => ParameterData(
        allParams: {
          'photoProduct': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProduct', PhotosProductRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'productId': getParameter<String>(data, 'productId'),
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'detailProduct': (data) async => ParameterData(
        allParams: {
          'productRef': getParameter<DocumentReference>(data, 'productRef'),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'VentePerruque': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
        },
      ),
  'categoryPage': (data) async => ParameterData(
        allParams: {
          'categoryName': getParameter<String>(data, 'categoryName'),
          'categoryValue': getParameter<String>(data, 'categoryValue'),
        },
      ),
  'PictureGallery': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
        },
      ),
  'Grow_up_Picture': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'photosProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photosProductRef', PhotosProductRecord.fromSnapshot),
          'uploapGownPicture': getParameter<String>(data, 'uploapGownPicture'),
        },
      ),
  'MyList': ParameterData.none(),
  'Faire_une_Offre': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
        },
      ),
  'OffresFaites': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'offerPrice': getParameter<String>(data, 'offerPrice'),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'OffreRecues': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'receivedOffersRef': await getDocumentParameter<ReceivedOffersRecord>(
              data, 'receivedOffersRef', ReceivedOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'ListeOffresFaites': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'ListeOffresRecues': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'receivedOffersRef': await getDocumentParameter<ReceivedOffersRecord>(
              data, 'receivedOffersRef', ReceivedOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'TraitementOffreRecue': (data) async => ParameterData(
        allParams: {
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'producRef': await getDocumentParameter<ProductsRecord>(
              data, 'producRef', ProductsRecord.fromSnapshot),
          'receivedOffersRef': await getDocumentParameter<ReceivedOffersRecord>(
              data, 'receivedOffersRef', ReceivedOffersRecord.fromSnapshot),
        },
      ),
  'swipeableStack': (data) async => ParameterData(
        allParams: {
          'usersFavoritesPictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritesPictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
          'productIdRef': getParameter<String>(data, 'productIdRef'),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_main': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'support_TicketList': ParameterData.none(),
  'support_SubmitTicket': ParameterData.none(),
  'support_TicketDetails': (data) async => ParameterData(
        allParams: {
          'ticketRef': await getDocumentParameter<SupportTicketsRecord>(
              data, 'ticketRef', SupportTicketsRecord.fromSnapshot),
        },
      ),
  'FavoriteSwipeableStack': (data) async => ParameterData(
        allParams: {
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
          'productId': getParameter<String>(data, 'productId'),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'Gallerie_PerruquesCopy': (data) async => ParameterData(
        allParams: {
          'photoProduct': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProduct', PhotosProductRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'productId': getParameter<String>(data, 'productId'),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_ai_Screen': ParameterData.none(),
  'DialogueModalPaiement': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
        },
      ),
  'HomePageFilActuality': ParameterData.none(),
  'AddPageActuality': ParameterData.none(),
  'postDetails': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'chatindividuel': ParameterData.none(),
  'IdVendeur': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'PaiementWave': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
        },
      ),
  'PaiementOrange': ParameterData.none(),
  'PayementRefuse': ParameterData.none(),
  'VotrePaiementAccepte': (data) async => ParameterData(
        allParams: {
          'productRef': await getDocumentParameter<ProductsRecord>(
              data, 'productRef', ProductsRecord.fromSnapshot),
          'photoProductRef': await getDocumentParameter<PhotosProductRecord>(
              data, 'photoProductRef', PhotosProductRecord.fromSnapshot),
          'sentOffersRef': await getDocumentParameter<SentOffersRecord>(
              data, 'sentOffersRef', SentOffersRecord.fromSnapshot),
          'usersFavoritePictures':
              await getDocumentParameter<UsersFavoritePicturesRecord>(
                  data,
                  'usersFavoritePictures',
                  UsersFavoritePicturesRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
