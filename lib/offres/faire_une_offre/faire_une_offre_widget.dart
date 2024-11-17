import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'faire_une_offre_model.dart';
export 'faire_une_offre_model.dart';

class FaireUneOffreWidget extends StatefulWidget {
  const FaireUneOffreWidget({
    super.key,
    required this.productRef,
    required this.sentOffersRef,
  });

  final ProductsRecord? productRef;
  final SentOffersRecord? sentOffersRef;

  @override
  State<FaireUneOffreWidget> createState() => _FaireUneOffreWidgetState();
}

class _FaireUneOffreWidgetState extends State<FaireUneOffreWidget> {
  late FaireUneOffreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaireUneOffreModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Faire_une_Offre'});
    _model.offerPriceTextController ??= TextEditingController();
    _model.offerPriceFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('FAIRE_UNE_OFFRE_arrow_back_rounded_ICN_O');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'g6bf147f' /* Faire une Offre */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<List<ProductsRecord>>(
          stream: queryProductsRecord(
            singleRecord: true,
          ),
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
            List<ProductsRecord> columnProductsRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final columnProductsRecord = columnProductsRecordList.isNotEmpty
                ? columnProductsRecordList.first
                : null;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'm2g3prvt' /* Ton Offre  */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 93.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
                    child: TextFormField(
                      controller: _model.offerPriceTextController,
                      focusNode: _model.offerPriceFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.offerPriceTextController',
                        Duration(milliseconds: 2000),
                        () => safeSetState(() {}),
                      ),
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'l16jqesn' /* En Fcfa : */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.start,
                      maxLines: 7,
                      keyboardType: TextInputType.number,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.offerPriceTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.network(
                      widget!.productRef!.photos,
                      width: double.infinity,
                      height: 263.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 359.0,
                    height: 43.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: widget!.productRef?.sellerId != currentUserUid,
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'FAIRE_UNE_OFFRE_PAGE_PROPOSER_BTN_ON_TAP');
                          await Future.wait([
                            Future(() async {
                              logFirebaseEvent('Button_backend_call');

                              await SentOffersRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createSentOffersRecordData(
                                  offerUserID: currentUserUid,
                                  offerPrice:
                                      _model.offerPriceTextController.text,
                                  productId: widget!.productRef?.productId,
                                  offerName: currentUserDisplayName,
                                  nouvelleOffre:
                                      widget!.sentOffersRef?.nouvelleOffre,
                                  receivedId: random_data.randomString(
                                    1,
                                    5,
                                    true,
                                    false,
                                    false,
                                  ),
                                  sentOffersId: random_data.randomString(
                                    1,
                                    5,
                                    true,
                                    false,
                                    false,
                                  ),
                                  docSentId: currentUserDocument?.profilRef?.id,
                                  sellerId: valueOrDefault<String>(
                                    widget!.productRef?.sellerId,
                                    '-',
                                  ),
                                  docProductId:
                                      widget!.productRef?.docProductId,
                                  pictureProduct: widget!.productRef?.photos,
                                  pricePerruque: widget!.productRef?.price,
                                  statutOffersReceived: widget!
                                      .sentOffersRef?.statutOffersReceived,
                                  name: widget!.productRef?.name,
                                  email: currentUserEmail,
                                  phoneNumber: currentPhoneNumber,
                                  pictureUserOffert:
                                      widget!.productRef?.sellerPicture,
                                  statutOffersReceived2: '',
                                  emailSeller: valueOrDefault<String>(
                                    widget!.productRef?.email,
                                    '-',
                                  ),
                                  phoneNumberSeller: valueOrDefault<String>(
                                    widget!.productRef?.phoneNumber,
                                    '-',
                                  ),
                                ),
                                ...mapToFirestore(
                                  {
                                    'offerDate': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }),
                            Future(() async {
                              logFirebaseEvent('Button_backend_call');

                              await ReceivedOffersRecord.createDoc(
                                      currentUserReference!)
                                  .set({
                                ...createReceivedOffersRecordData(
                                  productId: widget!.productRef?.productId,
                                  priceReceived:
                                      _model.offerPriceTextController.text,
                                  nameReceived: widget!.productRef?.sellerId,
                                  sellerId: widget!.productRef?.sellerId,
                                  docProductId:
                                      widget!.productRef?.docProductId,
                                  receivedId: '',
                                  idUserReceived: '',
                                  sentOfferId: '',
                                  pictureProduct: widget!.productRef?.photos,
                                  pricePerruque: widget!.productRef?.price,
                                  email: currentUserEmail,
                                  phoneNumber: currentPhoneNumber,
                                  pictureUserOffert:
                                      widget!.sentOffersRef?.pictureUserOffert,
                                ),
                                ...mapToFirestore(
                                  {
                                    'dateReceived':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }),
                          ]);
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            'OffresFaites',
                            queryParameters: {
                              'productRef': serializeParam(
                                widget!.productRef,
                                ParamType.Document,
                              ),
                              'sentOffersRef': serializeParam(
                                widget!.sentOffersRef,
                                ParamType.Document,
                              ),
                              'offerPrice': serializeParam(
                                _model.offerPriceTextController.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'productRef': widget!.productRef,
                              'sentOffersRef': widget!.sentOffersRef,
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'yafmo0zp' /* Proposer */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
