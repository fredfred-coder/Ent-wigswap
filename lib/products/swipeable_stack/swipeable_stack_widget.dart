import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'swipeable_stack_model.dart';
export 'swipeable_stack_model.dart';

class SwipeableStackWidget extends StatefulWidget {
  const SwipeableStackWidget({
    super.key,
    this.usersFavoritesPictures,
    this.productRef,
    this.sentOffersRef,
    this.photoProductRef,
    this.productIdRef,
    this.chatRef,
  });

  final UsersFavoritePicturesRecord? usersFavoritesPictures;
  final ProductsRecord? productRef;
  final SentOffersRecord? sentOffersRef;
  final PhotosProductRecord? photoProductRef;
  final String? productIdRef;
  final ChatsRecord? chatRef;

  @override
  State<SwipeableStackWidget> createState() => _SwipeableStackWidgetState();
}

class _SwipeableStackWidgetState extends State<SwipeableStackWidget> {
  late SwipeableStackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeableStackModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'swipeableStack'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).warning,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('SWIPEABLE_STACK_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'aztaaoaz' /* swipeableStack */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).alternate,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 420.0,
                  height: 430.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).tertiary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: StreamBuilder<List<ProductsRecord>>(
                    stream: queryProductsRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ProductsRecord> swipeableStackProductsRecordList =
                          snapshot.data!;

                      return FlutterFlowSwipeableStack(
                        onSwipeFn: (index) {},
                        onLeftSwipe: (index) {},
                        onRightSwipe: (index) async {
                          logFirebaseEvent(
                              'SWIPEABLE_STACK_SwipeableStack_smunpe71_');
                          final swipeableStackProductsRecord =
                              swipeableStackProductsRecordList[index];
                          logFirebaseEvent('SwipeableStack_swipeable_stack');
                          _model.swipeableStackController.swipeRight();
                          logFirebaseEvent('SwipeableStack_backend_call');

                          await UsersFavoritePicturesRecord.createDoc(
                                  currentUserReference!)
                              .set(createUsersFavoritePicturesRecordData(
                            usersFavoritePictures:
                                swipeableStackProductsRecordList[index]?.photos,
                            userId: currentUserUid,
                            productId: swipeableStackProductsRecordList[index]
                                ?.productId,
                            isSwipedRight: !valueOrDefault<bool>(
                                currentUserDocument?.isSwipedRight, false),
                            taille:
                                swipeableStackProductsRecordList[index]?.taille,
                            quality: swipeableStackProductsRecordList[index]
                                ?.quality,
                            prix:
                                swipeableStackProductsRecordList[index]?.price,
                            statut: '',
                            email:
                                swipeableStackProductsRecordList[index]?.email,
                            phoneNumber: swipeableStackProductsRecordList[index]
                                ?.phoneNumber,
                            name: swipeableStackProductsRecordList[index]?.name,
                            sellerPicture:
                                swipeableStackProductsRecordList[index]
                                    ?.sellerPicture,
                          ));
                        },
                        onUpSwipe: (index) {},
                        onDownSwipe: (index) {},
                        itemBuilder: (context, swipeableStackIndex) {
                          final swipeableStackProductsRecord =
                              swipeableStackProductsRecordList[
                                  swipeableStackIndex];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              swipeableStackProductsRecord.photos,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        itemCount: swipeableStackProductsRecordList.length,
                        controller: _model.swipeableStackController,
                        loop: true,
                        cardDisplayCount: 200,
                        scale: 0.9,
                        backCardOffset: const Offset(50.0, 50.0),
                      );
                    },
                  ),
                ),
                Container(
                  width: 376.0,
                  height: 242.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: GradientText(
                              FFLocalizations.of(context).getText(
                                '8uatliye' /* Swipe */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).warning,
                                    letterSpacing: 0.0,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).secondaryText
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 345.0,
                            height: 61.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 116.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFFE00C1C),
                                      icon: Icon(
                                        Icons.clear,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFF0BD515),
                                      icon: Icon(
                                        Icons.done,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: 312.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SWIPEABLE_STACK_MA_LISTE_DE_FAVORITS_BTN');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'FavoriteSwipeableStack',
                                queryParameters: {
                                  'usersFavoritePictures': serializeParam(
                                    widget!.usersFavoritesPictures,
                                    ParamType.Document,
                                  ),
                                  'productRef': serializeParam(
                                    widget!.productRef,
                                    ParamType.Document,
                                  ),
                                  'sentOffersRef': serializeParam(
                                    widget!.sentOffersRef,
                                    ParamType.Document,
                                  ),
                                  'photoProductRef': serializeParam(
                                    widget!.photoProductRef,
                                    ParamType.Document,
                                  ),
                                  'productId': serializeParam(
                                    widget!.productIdRef,
                                    ParamType.String,
                                  ),
                                  'chatRef': serializeParam(
                                    widget!.chatRef,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'usersFavoritePictures':
                                      widget!.usersFavoritesPictures,
                                  'productRef': widget!.productRef,
                                  'sentOffersRef': widget!.sentOffersRef,
                                  'photoProductRef': widget!.photoProductRef,
                                  'chatRef': widget!.chatRef,
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 600),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'intyenh1' /* Ma liste de Favorits */,
                            ),
                            options: FFButtonOptions(
                              height: 27.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).warning,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
