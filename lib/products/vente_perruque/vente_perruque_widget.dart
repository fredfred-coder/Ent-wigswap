import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vente_perruque_model.dart';
export 'vente_perruque_model.dart';

class VentePerruqueWidget extends StatefulWidget {
  const VentePerruqueWidget({
    super.key,
    required this.productRef,
    this.photoProductRef,
    this.sentOffersRef,
    this.usersFavoritePictures,
  });

  final ProductsRecord? productRef;
  final PhotosProductRecord? photoProductRef;
  final SentOffersRecord? sentOffersRef;
  final UsersFavoritePicturesRecord? usersFavoritePictures;

  @override
  State<VentePerruqueWidget> createState() => _VentePerruqueWidgetState();
}

class _VentePerruqueWidgetState extends State<VentePerruqueWidget> {
  late VentePerruqueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VentePerruqueModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VentePerruque'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryText,
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
              logFirebaseEvent('VENTE_PERRUQUE_arrow_back_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'lpvedn6f' /* Vente Perruque */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w900,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Container(
                        width: 135.0,
                        height: 119.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.uploadedFileUrl,
                              'data:image/png;base64,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',
                            ),
                            width: 507.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
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
                          List<ProductsRecord> containerProductsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerProductsRecord =
                              containerProductsRecordList.isNotEmpty
                                  ? containerProductsRecordList.first
                                  : null;

                          return Container(
                            width: 338.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'VENTE_PERRUQUE_TLCHARGER_UNE_PHOTO_BTN_O');
                                logFirebaseEvent(
                                    'Button_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 1500.00,
                                  maxHeight: 1500.00,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                logFirebaseEvent('Button_backend_call');

                                await containerProductsRecord!.reference
                                    .update({
                                  ...createProductsRecordData(
                                    photos: containerProductsRecord?.photos,
                                    productId:
                                        containerProductsRecord?.productId,
                                    sellerId: containerProductsRecord?.sellerId,
                                    like: containerProductsRecord?.like,
                                    dislike: containerProductsRecord?.dislike,
                                    description: '',
                                    price: '',
                                    statuts: '',
                                    category: '',
                                    name: valueOrDefault(
                                        currentUserDocument?.name, ''),
                                    quality: '',
                                    taille: '',
                                    sellerPicture: '',
                                    nameUserSeller: '',
                                    paysUserProduct: '',
                                    cityUserProduct: '',
                                    docProductId: '',
                                    photoPosted: '',
                                    phoneNumber: currentPhoneNumber,
                                    email: currentUserEmail,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'date': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Button_backend_call');

                                await PhotosProductRecord.createDoc(
                                        containerProductsRecord!.reference)
                                    .set({
                                  ...createPhotosProductRecordData(
                                    photosUrl: _model.uploadedFileUrl,
                                    productId: valueOrDefault<String>(
                                      containerProductsRecord?.productId,
                                      '-',
                                    ),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'created_time':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Button_backend_call');

                                await UsersFavoritePicturesRecord.createDoc(
                                        currentUserReference!)
                                    .set(createUsersFavoritePicturesRecordData(
                                  usersFavoritePictures:
                                      containerProductsRecord?.photos,
                                  userId: currentUserUid,
                                  productId: containerProductsRecord?.productId,
                                  isSwipedRight: valueOrDefault<bool>(
                                      currentUserDocument?.isSwipedRight,
                                      false),
                                ));
                              },
                              text: FFLocalizations.of(context).getText(
                                '1w8qqxx7' /* Télécharger  une Photo */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 43.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'ft94prgk' /* Prix souhaité en Fcfa */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        height: 43.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 8.0, 5.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qnedmuaq' /* Description */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'r2lizl62' /* En quelques mots */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 1.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 57.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                        ),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.sizeValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              'rz5n49d6' /* 8 à 20 cm */,
                            ),
                            FFLocalizations.of(context).getText(
                              'czb57cba' /* 22 à 30 cm */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1et9tk6s' /* 30 à 42 cm */,
                            ),
                            FFLocalizations.of(context).getText(
                              'n45i5h9w' /* Autres */,
                            )
                          ],
                          onChanged: (val) =>
                              safeSetState(() => _model.sizeValue = val),
                          width: 300.0,
                          height: 46.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'azsi10um' /* Sélectionner votre Taille */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 53.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                        ),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.qualityValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              'lfrcexla' /* Brésilienne */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vnltqo5z' /* Indienne */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rjdmkv7o' /* RawHair */,
                            ),
                            FFLocalizations.of(context).getText(
                              '6hh4yu1d' /* Autres */,
                            )
                          ],
                          onChanged: (val) =>
                              safeSetState(() => _model.qualityValue = val),
                          width: 300.0,
                          height: 34.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '99krshhg' /* Qualitée */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 71.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            )
                          ],
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: StreamBuilder<List<CategoryRecord>>(
                            stream: queryCategoryRecord(),
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
                              List<CategoryRecord> categoryCategoryRecordList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                controller: _model.categoryValueController ??=
                                    FormFieldController<String>(
                                  _model.categoryValue ??= '',
                                ),
                                options:
                                    List<String>.from(categoryCategoryRecordList
                                        .map((e) => valueOrDefault<String>(
                                              e.value,
                                              '-',
                                            ))
                                        .toList()),
                                optionLabels: categoryCategoryRecordList
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.categoryValue = val),
                                width: 300.0,
                                height: 85.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'laxtxwp1' /* Category */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: 345.0,
                        height: 79.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'VENTE_PERRUQUE_VENDS_TA_PERRUQUE_BTN_ON_');
                              logFirebaseEvent('Button_backend_call');

                              await ProductsRecord.collection.doc().set({
                                ...createProductsRecordData(
                                  price: _model.textController1.text,
                                  photos: _model.uploadedFileUrl,
                                  productId: random_data.randomString(
                                    1,
                                    8,
                                    true,
                                    false,
                                    false,
                                  ),
                                  category: _model.categoryValue,
                                  sellerId: currentUserUid,
                                  description: _model.textController2.text,
                                  name: valueOrDefault(
                                      currentUserDocument?.name, ''),
                                  quality: _model.qualityValue,
                                  taille: _model.sizeValue,
                                  sellerPicture: currentUserPhoto,
                                  nameUserSeller: valueOrDefault(
                                      currentUserDocument?.name, ''),
                                  paysUserProduct: valueOrDefault(
                                      currentUserDocument?.country, ''),
                                  cityUserProduct: valueOrDefault(
                                      currentUserDocument?.city, ''),
                                  docProductId: random_data.randomString(
                                    1,
                                    8,
                                    true,
                                    false,
                                    false,
                                  ),
                                  like: '',
                                  dislike: '',
                                  photoPosted: '',
                                  phoneNumber: currentPhoneNumber,
                                  email: currentUserEmail,
                                ),
                                ...mapToFirestore(
                                  {
                                    'date': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_navigate_back');
                              context.safePop();
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Gallerie_Perruques',
                                queryParameters: {
                                  'photoProduct': serializeParam(
                                    widget!.photoProductRef,
                                    ParamType.Document,
                                  ),
                                  'sentOffersRef': serializeParam(
                                    widget!.sentOffersRef,
                                    ParamType.Document,
                                  ),
                                  'productRef': serializeParam(
                                    widget!.productRef,
                                    ParamType.Document,
                                  ),
                                  'productId': serializeParam(
                                    widget!.productRef?.productId,
                                    ParamType.String,
                                  ),
                                  'usersFavoritePictures': serializeParam(
                                    widget!.usersFavoritePictures,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'photoProduct': widget!.photoProductRef,
                                  'sentOffersRef': widget!.sentOffersRef,
                                  'productRef': widget!.productRef,
                                  'usersFavoritePictures':
                                      widget!.usersFavoritePictures,
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'kccr78mb' /* Vends ta Perruque */,
                            ),
                            options: FFButtonOptions(
                              height: 139.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
