import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Auth2LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'Profil',
          path: '/profil',
          requireAuth: true,
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'photosProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'receivedOffersRef': getDoc(
                ['users', 'receivedOffers'], ReceivedOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profil')
              : ProfilWidget(
                  productRef: params.getParam(
                    'productRef',
                    ParamType.Document,
                  ),
                  photosProductRef: params.getParam(
                    'photosProductRef',
                    ParamType.Document,
                  ),
                  usersFavoritePictures: params.getParam(
                    'usersFavoritePictures',
                    ParamType.Document,
                  ),
                  sentOffersRef: params.getParam(
                    'sentOffersRef',
                    ParamType.Document,
                  ),
                  receivedOffersRef: params.getParam(
                    'receivedOffersRef',
                    ParamType.Document,
                  ),
                  chatRef: params.getParam(
                    'chatRef',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'Profile08',
          path: '/profile08',
          builder: (context, params) => Profile08Widget(),
        ),
        FFRoute(
          name: 'CreateIdUsers',
          path: '/createIdUsers',
          builder: (context, params) => CreateIdUsersWidget(),
        ),
        FFRoute(
          name: 'auth_2_Create',
          path: '/auth2Create',
          builder: (context, params) => Auth2CreateWidget(),
        ),
        FFRoute(
          name: 'auth_2_Login',
          path: '/auth2Login',
          builder: (context, params) => Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          requireAuth: true,
          builder: (context, params) => Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'Gallerie_Perruques',
          path: '/galleriePerruques',
          asyncParams: {
            'photoProduct': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Gallerie_Perruques')
              : GalleriePerruquesWidget(
                  photoProduct: params.getParam(
                    'photoProduct',
                    ParamType.Document,
                  ),
                  sentOffersRef: params.getParam(
                    'sentOffersRef',
                    ParamType.Document,
                  ),
                  productRef: params.getParam(
                    'productRef',
                    ParamType.Document,
                  ),
                  productId: params.getParam(
                    'productId',
                    ParamType.String,
                  ),
                  usersFavoritePictures: params.getParam(
                    'usersFavoritePictures',
                    ParamType.Document,
                  ),
                  chatRef: params.getParam(
                    'chatRef',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'detailProduct',
          path: '/detailProduct',
          asyncParams: {
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => DetailProductWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'VentePerruque',
          path: '/ventePerruque',
          requireAuth: true,
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
          },
          builder: (context, params) => VentePerruqueWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            photoProductRef: params.getParam(
              'photoProductRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            usersFavoritePictures: params.getParam(
              'usersFavoritePictures',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'categoryPage',
          path: '/categoryPage',
          builder: (context, params) => CategoryPageWidget(
            categoryName: params.getParam(
              'categoryName',
              ParamType.String,
            ),
            categoryValue: params.getParam(
              'categoryValue',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PictureGallery',
          path: '/pictureGallery',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => PictureGalleryWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Grow_up_Picture',
          path: '/growUpPicture',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'photosProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
          },
          builder: (context, params) => GrowUpPictureWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            photosProductRef: params.getParam(
              'photosProductRef',
              ParamType.Document,
            ),
            uploapGownPicture: params.getParam(
              'uploapGownPicture',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MyList',
          path: '/myList',
          builder: (context, params) => MyListWidget(),
        ),
        FFRoute(
          name: 'Faire_une_Offre',
          path: '/faireUneOffre',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
          },
          builder: (context, params) => FaireUneOffreWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'OffresFaites',
          path: '/offresFaites',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => OffresFaitesWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            offerPrice: params.getParam(
              'offerPrice',
              ParamType.String,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'OffreRecues',
          path: '/offreRecues',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'receivedOffersRef': getDoc(
                ['users', 'receivedOffers'], ReceivedOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => OffreRecuesWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            receivedOffersRef: params.getParam(
              'receivedOffersRef',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ListeOffresFaites',
          path: '/listeOffresFaites',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ListeOffresFaitesWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ListeOffresRecues',
          path: '/listeOffresRecues',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'receivedOffersRef': getDoc(
                ['users', 'receivedOffers'], ReceivedOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ListeOffresRecuesWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            receivedOffersRef: params.getParam(
              'receivedOffersRef',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'TraitementOffreRecue',
          path: '/traitementOffreRecue',
          asyncParams: {
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'producRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'receivedOffersRef': getDoc(
                ['users', 'receivedOffers'], ReceivedOffersRecord.fromSnapshot),
          },
          builder: (context, params) => TraitementOffreRecueWidget(
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            producRef: params.getParam(
              'producRef',
              ParamType.Document,
            ),
            receivedOffersRef: params.getParam(
              'receivedOffersRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'swipeableStack',
          path: '/swipeableStack',
          asyncParams: {
            'usersFavoritesPictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'swipeableStack')
              : SwipeableStackWidget(
                  usersFavoritesPictures: params.getParam(
                    'usersFavoritesPictures',
                    ParamType.Document,
                  ),
                  productRef: params.getParam(
                    'productRef',
                    ParamType.Document,
                  ),
                  sentOffersRef: params.getParam(
                    'sentOffersRef',
                    ParamType.Document,
                  ),
                  photoProductRef: params.getParam(
                    'photoProductRef',
                    ParamType.Document,
                  ),
                  productIdRef: params.getParam(
                    'productIdRef',
                    ParamType.String,
                  ),
                  chatRef: params.getParam(
                    'chatRef',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'chat_2_main')
              : Chat2MainWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'support_TicketList',
          path: '/supportTicketList',
          builder: (context, params) => SupportTicketListWidget(),
        ),
        FFRoute(
          name: 'support_SubmitTicket',
          path: '/supportSubmitTicket',
          builder: (context, params) => SupportSubmitTicketWidget(),
        ),
        FFRoute(
          name: 'support_TicketDetails',
          path: '/supportTicketDetails',
          asyncParams: {
            'ticketRef':
                getDoc(['supportTickets'], SupportTicketsRecord.fromSnapshot),
          },
          builder: (context, params) => SupportTicketDetailsWidget(
            ticketRef: params.getParam(
              'ticketRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'FavoriteSwipeableStack',
          path: '/favoriteSwipeableStack',
          asyncParams: {
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => FavoriteSwipeableStackWidget(
            usersFavoritePictures: params.getParam(
              'usersFavoritePictures',
              ParamType.Document,
            ),
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            photoProductRef: params.getParam(
              'photoProductRef',
              ParamType.Document,
            ),
            productId: params.getParam(
              'productId',
              ParamType.String,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Gallerie_PerruquesCopy',
          path: '/galleriePerruquesCopy',
          asyncParams: {
            'photoProduct': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => GalleriePerruquesCopyWidget(
            photoProduct: params.getParam(
              'photoProduct',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            productId: params.getParam(
              'productId',
              ParamType.String,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_ai_Screen',
          path: '/chatAiScreen',
          builder: (context, params) => ChatAiScreenWidget(),
        ),
        FFRoute(
          name: 'DialogueModalPaiement',
          path: '/dialogueModalPaiement',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'DialogueModalPaiement')
              : DialogueModalPaiementWidget(
                  productRef: params.getParam(
                    'productRef',
                    ParamType.Document,
                  ),
                  sentOffersRef: params.getParam(
                    'sentOffersRef',
                    ParamType.Document,
                  ),
                  photoProductRef: params.getParam(
                    'photoProductRef',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'HomePageFilActuality',
          path: '/homePageFilActuality',
          builder: (context, params) => HomePageFilActualityWidget(),
        ),
        FFRoute(
          name: 'AddPageActuality',
          path: '/addPageActuality',
          builder: (context, params) => AddPageActualityWidget(),
        ),
        FFRoute(
          name: 'postDetails',
          path: '/postDetails',
          builder: (context, params) => PostDetailsWidget(
            postRef: params.getParam(
              'postRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['posts'],
            ),
          ),
        ),
        FFRoute(
          name: 'chatindividuel',
          path: '/chatindividuel',
          builder: (context, params) => ChatindividuelWidget(),
        ),
        FFRoute(
          name: 'IdVendeur',
          path: '/idVendeur',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => IdVendeurWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PaiementWave',
          path: '/paiementWave',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
          },
          builder: (context, params) => PaiementWaveWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            photoProductRef: params.getParam(
              'photoProductRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            usersFavoritePictures: params.getParam(
              'usersFavoritePictures',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'PaiementOrange',
          path: '/paiementOrange',
          builder: (context, params) => PaiementOrangeWidget(),
        ),
        FFRoute(
          name: 'PayementRefuse',
          path: '/payementRefuse',
          builder: (context, params) => PayementRefuseWidget(),
        ),
        FFRoute(
          name: 'VotrePaiementAccepte',
          path: '/votrePaiementAccepte',
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
            'photoProductRef': getDoc(['products', 'photosProduct'],
                PhotosProductRecord.fromSnapshot),
            'sentOffersRef':
                getDoc(['users', 'sentOffers'], SentOffersRecord.fromSnapshot),
            'usersFavoritePictures': getDoc(['users', 'UsersFavoritePictures'],
                UsersFavoritePicturesRecord.fromSnapshot),
          },
          builder: (context, params) => VotrePaiementAccepteWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            photoProductRef: params.getParam(
              'photoProductRef',
              ParamType.Document,
            ),
            sentOffersRef: params.getParam(
              'sentOffersRef',
              ParamType.Document,
            ),
            usersFavoritePictures: params.getParam(
              'usersFavoritePictures',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth2Login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
