import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'votre_paiement_accepte_model.dart';
export 'votre_paiement_accepte_model.dart';

class VotrePaiementAccepteWidget extends StatefulWidget {
  const VotrePaiementAccepteWidget({
    super.key,
    this.productRef,
    this.photoProductRef,
    this.sentOffersRef,
    this.usersFavoritePictures,
  });

  final ProductsRecord? productRef;
  final PhotosProductRecord? photoProductRef;
  final SentOffersRecord? sentOffersRef;
  final UsersFavoritePicturesRecord? usersFavoritePictures;

  @override
  State<VotrePaiementAccepteWidget> createState() =>
      _VotrePaiementAccepteWidgetState();
}

class _VotrePaiementAccepteWidgetState
    extends State<VotrePaiementAccepteWidget> {
  late VotrePaiementAccepteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VotrePaiementAccepteModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VotrePaiementAccepte'});
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
              logFirebaseEvent('VOTRE_PAIEMENT_ACCEPTE_arrow_back_rounde');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'ch6h9re3' /* Payement réussi */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 22.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                )
              ],
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 390.0,
                height: 349.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              0.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: 327.0,
                            height: 289.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/telechargement_(9).jpeg',
                                width: 200.0,
                                height: 490.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 321.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              0.0, 0.0, 0.0, 15.0),
                          child: GradientText(
                            FFLocalizations.of(context).getText(
                              'rhw4a6vw' /* "votre payement est réussi" */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                              fontFamily: 'Outfit',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              shadows: [
                                Shadow(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientText(
                          FFLocalizations.of(context).getText(
                            'lzscjkyk' /* "Merci pour votre confiance". */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).tertiary
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  width: 320.0,
                  height: 46.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'VOTRE_PAIEMENT_ACCEPTE__PUBLIER_UN_ARTIC');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        'VentePerruque',
                        queryParameters: {
                          'productRef': serializeParam(
                            widget!.productRef,
                            ParamType.Document,
                          ),
                          'photoProductRef': serializeParam(
                            widget!.photoProductRef,
                            ParamType.Document,
                          ),
                          'sentOffersRef': serializeParam(
                            widget!.sentOffersRef,
                            ParamType.Document,
                          ),
                          'usersFavoritePictures': serializeParam(
                            widget!.usersFavoritePictures,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'productRef': widget!.productRef,
                          'photoProductRef': widget!.photoProductRef,
                          'sentOffersRef': widget!.sentOffersRef,
                          'usersFavoritePictures':
                              widget!.usersFavoritePictures,
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'd3y6l8w4' /* "Publier un article" */,
                    ),
                    options: FFButtonOptions(
                      height: 3.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
