import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'paiement_wave_model.dart';
export 'paiement_wave_model.dart';

class PaiementWaveWidget extends StatefulWidget {
  const PaiementWaveWidget({
    super.key,
    this.productRef,
    this.photoProductRef,
    this.sentOffersRef,
    this.usersFavoritePictures,
    String? minAmount,
    required this.localPhoneNumber,
  }) : this.minAmount = minAmount ?? '\"1000\"';

  final ProductsRecord? productRef;
  final PhotosProductRecord? photoProductRef;
  final SentOffersRecord? sentOffersRef;
  final UsersFavoritePicturesRecord? usersFavoritePictures;
  final String minAmount;
  final String? localPhoneNumber;

  @override
  State<PaiementWaveWidget> createState() => _PaiementWaveWidgetState();
}

class _PaiementWaveWidgetState extends State<PaiementWaveWidget> {
  late PaiementWaveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaiementWaveModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaiementWave'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('PAIEMENT_WAVE_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: GradientText(
            FFLocalizations.of(context).getText(
              'oe2b81lr' /* Subscription */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              fontSize: 25.0,
              letterSpacing: 0.0,
              shadows: [
                Shadow(
                  color: FlutterFlowTheme.of(context).secondaryText,
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
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 406.0,
                height: 240.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/telechargement_(1).png',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 370.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: FFLocalizations.of(context).getText(
                                  'nyxpijap' /* "1000 Fcfa" */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 20.0,
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
                                hintText: FFLocalizations.of(context).getText(
                                  '9wyi2fte' /*  */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PAIEMENT_WAVE_PAGE_PAYER_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');
                            _model.userDocument =
                                await UsersRecord.getDocumentOnce(
                                    currentUserReference!);
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().currentUserPhoneNumber =
                                currentPhoneNumber;
                            FFAppState().currentUserName =
                                valueOrDefault(currentUserDocument?.name, '');
                            safeSetState(() {});
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFAppState().currentUserName,
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFAppState().currentUserPhoneNumber,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                duration: Duration(milliseconds: 4200),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFAppState().apiGetAmount.toString(),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResultzpe =
                                await GetPayementStatutCall.call(
                              apiGetAmount: functions.amountJson(),
                              amount: FFAppState().FixeValue.toString(),
                              currentUserPhoneNumber:
                                  FFAppState().currentUserPhoneNumber,
                            );
                            if (_model.apiResultzpe?.succeeded ?? true) {
                              _model.apiResultzpe?.streamedResponse?.stream
                                  .transform(utf8.decoder)
                                  .transform(const LineSplitter())
                                  .transform(ServerSentEventLineTransformer())
                                  .map((m) => ResponseStreamMessage(message: m))
                                  .listen(
                                    (onMessageInput) async {},
                                    onError: (onErrorInput) async {},
                                    onDone: () async {},
                                  );
                            }

                            if (FFAppState().apiGetAmount >=
                                valueOrDefault<double>(
                                  FFAppState().FixeValue,
                                  1000.0,
                                )) {
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResultn7n =
                                  await PostWavePaymentCall.call();
                              if (_model.apiResultn7n?.succeeded ?? true) {
                                _model.apiResultn7n?.streamedResponse?.stream
                                    .transform(utf8.decoder)
                                    .transform(const LineSplitter())
                                    .transform(ServerSentEventLineTransformer())
                                    .map((m) =>
                                        ResponseStreamMessage(message: m))
                                    .listen(
                                      (onMessageInput) async {},
                                      onError: (onErrorInput) async {},
                                      onDone: () async {},
                                    );
                              }

                              logFirebaseEvent('Button_backend_call');

                              await PaiementRecord.collection
                                  .doc()
                                  .set(createPaiementRecordData(
                                    userId: currentUserUid,
                                    paiementId: random_data.randomString(
                                      1,
                                      5,
                                      true,
                                      false,
                                      false,
                                    ),
                                    userName: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    status: '\"Succeed\"',
                                    amount: '\"1000\"',
                                    phoneNumber: currentPhoneNumber,
                                    dateTime: '',
                                  ));
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'VotrePaiementAccepte',
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
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            } else {
                              logFirebaseEvent('Button_backend_call');

                              await PaiementRecord.collection
                                  .doc()
                                  .set(createPaiementRecordData(
                                    userId: currentUserUid,
                                    paiementId: random_data.randomString(
                                      1,
                                      5,
                                      true,
                                      false,
                                      false,
                                    ),
                                    userName: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    status: '\"Failed\"',
                                    amount: '1000',
                                    phoneNumber: currentPhoneNumber,
                                  ));
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'PayementRefuse',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '7usvv8at' /* Payer */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
