import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'traitement_offre_recue_model.dart';
export 'traitement_offre_recue_model.dart';

class TraitementOffreRecueWidget extends StatefulWidget {
  const TraitementOffreRecueWidget({
    super.key,
    required this.sentOffersRef,
    this.producRef,
    this.receivedOffersRef,
  });

  final SentOffersRecord? sentOffersRef;
  final ProductsRecord? producRef;
  final ReceivedOffersRecord? receivedOffersRef;

  @override
  State<TraitementOffreRecueWidget> createState() =>
      _TraitementOffreRecueWidgetState();
}

class _TraitementOffreRecueWidgetState
    extends State<TraitementOffreRecueWidget> {
  late TraitementOffreRecueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TraitementOffreRecueModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TraitementOffreRecue'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            logFirebaseEvent('TRAITEMENT_OFFRE_RECUE_arrow_back_rounde');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'qt898pgx' /* Traitement Offre Reçue */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget!.sentOffersRef!.pictureProduct,
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '5n7sppei' /* Prix de la Perruque  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.sentOffersRef?.pricePerruque,
                            '-',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zsij139e' /* Nom du client intéressé */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.sentOffersRef?.offerName,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 1.0, 5.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'iostnmhu' /* OfferDate :  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Text(
                          dateTimeFormat(
                            "yMMMd",
                            widget!.sentOffersRef!.offerDate!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 313.0,
                        height: 49.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FlutterFlowDropDown<String>(
                          controller:
                              _model.statutOfferReceivedValueController ??=
                                  FormFieldController<String>(
                            _model.statutOfferReceivedValue ??=
                                FFLocalizations.of(context).getText(
                              '5sv80n1u' /* "En attente De Décision" */,
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              '7yuadkj3' /* "Accepter" */,
                            ),
                            FFLocalizations.of(context).getText(
                              'whfcjwzt' /* "Refuser" */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r1ghns5o' /* "En Attente de décision" */,
                            )
                          ],
                          onChanged: (val) => safeSetState(
                              () => _model.statutOfferReceivedValue = val),
                          width: 392.0,
                          height: 28.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'fo3ljchr' /* "Traitement Offre Reçue" */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'TRAITEMENT_OFFRE_RECUE_Icon_ml9f9q99_ON_');
                          logFirebaseEvent('Icon_backend_call');

                          await widget!.sentOffersRef!.reference.update({
                            ...createSentOffersRecordData(
                              statutOffersReceived:
                                  _model.statutOfferReceivedValue,
                              offerUserID: widget!.sentOffersRef?.offerUserID,
                              offerPrice: widget!.sentOffersRef?.offerPrice,
                              productId: widget!.sentOffersRef?.productId,
                              offerName: widget!.sentOffersRef?.offerName,
                              nouvelleOffre:
                                  widget!.sentOffersRef?.nouvelleOffre,
                              docProductId: '',
                              pictureProduct:
                                  widget!.sentOffersRef?.pictureProduct,
                              pricePerruque:
                                  widget!.sentOffersRef?.pricePerruque,
                              name: '',
                              statutOfferSent:
                                  widget!.sentOffersRef?.statutOfferSent,
                            ),
                            ...mapToFirestore(
                              {
                                'offerDate': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed(
                            'ListeOffresRecues',
                            queryParameters: {
                              'productRef': serializeParam(
                                widget!.producRef,
                                ParamType.Document,
                              ),
                              'sentOffersRef': serializeParam(
                                widget!.sentOffersRef,
                                ParamType.Document,
                              ),
                              'receivedOffersRef': serializeParam(
                                widget!.receivedOffersRef,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'productRef': widget!.producRef,
                              'sentOffersRef': widget!.sentOffersRef,
                              'receivedOffersRef': widget!.receivedOffersRef,
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.send,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 36.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
