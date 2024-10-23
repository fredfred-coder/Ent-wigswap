import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'picture_gallery_model.dart';
export 'picture_gallery_model.dart';

class PictureGalleryWidget extends StatefulWidget {
  const PictureGalleryWidget({
    super.key,
    required this.productRef,
  });

  final ProductsRecord? productRef;

  @override
  State<PictureGalleryWidget> createState() => _PictureGalleryWidgetState();
}

class _PictureGalleryWidgetState extends State<PictureGalleryWidget> {
  late PictureGalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PictureGalleryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PictureGallery'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
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
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('PICTURE_GALLERY_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).alternate,
                              FlutterFlowTheme.of(context).tertiary
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      _model.uploadedFileUrl,
                                      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMAAAACUCAMAAADyHdbUAAAAMFBMVEXk5ueutLeqsLTM0NHn6erh4+Tc3+Dq7O3IzM63vL+xt7rZ3N3U19nP0tS/xMa7wMNI078WAAAEgElEQVR4nO2c3bajIAyFFQPIj/D+bzvoaefotFoCqcFZflcz69zsXQiJEOi6m5ubm5ubm/8Q0Bqk8wnnOq01tx4cAHIKvfilD14CcMvKRarRzqLXpP+b0XUX8ABq/u37d4g+TrJxCyAH8179YxzM0LQFGMy++gdmajagtfwsf55IptFQgOlg8mw9TC06kCFXf3IQJLfcF1TM158cRNXYIKic6b92YNpajaTF6U/YpkIZM30adFDw+y8OmonkWKS/7xtZi2As1N+LkVv7DPhS/QnHrb4rDoAfLLf6eQKVrEBPROCu7MDV6E8OuDOyrplAM4bXAPi6AUh4VgeALIHeEFn1T9X6e8s5BFCag1eIwKjf14bwjHVsQ1CXA56IgUt/+goj0J/CmKumA0cxgxKKy0D2NsQxwjMZwOxDHBqITFGsiGZQ3/Po7xTNAKQhYIri+jroaYApCEiywGJgZAkCIIrhROT5rKmvRJ9YHgNki1Df3waKoNMveDLZbYDbANkqymWAMIgvb+BOZCVAIDPAVEoMFy/mrl9OX/6DpupoYwOP/k7SbAvxfdR3VNsqE5P+quO9tQGujS2iOSTYthYrTog3BvhOiy+/vZ7KofowZm1+goFgBFj7z6B+DhnWjg+CY9aB+aC4+qCbVX79EAjOJejHQdUOqWD6lFlTV5Nyq5+pOa3nOh3bcvGWsw6yer7fwVfFbQFZpt+yldEvyKKVqKXmY1Wgn7vZbAO+68CwZ7At4FCVtTBN/f4zoDAXIJq7PjCT3z3UyPr/AuQ1T4i2wncNwPjZgmXayc1Dz7cQj359Mzb78/8A4EYjdq4iCjO49q+EQid9sC8ehLCjV+3Lf+KGKNakqcMtCQlo3Unnh2nwTs63o7kFYYEH+vkPbkG5LFqlUs4t99EfOKeUfPyxXRbpfhrHEKOx9m9KSPFsrYkxhHHyqmvTRJoqnRujMfYolYnFSZgUtBUToLu0cn7MwWviJNvxsLwBgJK/5AUR/BwWrNKhU++SVraJPs0mxucaQPrdsiF7HJIHnvICdIrZnfcXkMNggj/dAmiFjNpjzHSuBVAEZ0v/cN5BTVrw6eXP4TCctFHnQl3g7luwJ7xcAi4cfnJVWojTdxND+uil6zN7T1RfPPLQdHc2Dhi/VWMA3YWBQ761a4fcPKyy8IVIgKqTJLSDQD0IIEkaU/IdEG9eg0Q9/UKBpczMgH36hQS6HgRwX8xd+5DtYRM0dBQ6oLkqTdXaV+KAYgwY9ZM0VZPdGS6k1gHP+rOmcjU9f/1/oe7VhnPKt0NsRVWhiZqjqxDlr6+UNnEQI8bSTxzNHcBPCgs7fW4Buo8o7GxkzgBryrIB3S2rako+MrlT8IaioojuxjwF+EPakh6s74Gv6gifLCBBoEegLf3oIaB6uIYQXDqufj6OHGSbO9k1STpQjxrS3K+iBfWuZHszqMd1utPdUyUEsQ6x7kTsEvINNFNIrxGI+1q6oUL0F8yGNdFNZ1oQr0qybwa9J3uLaN6NbpH8ZUhNQ4tg3niGFkHovxB/AP6EQ7/tNBiKAAAAAElFTkSuQmCC',
                                    ),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Visibility(
                  visible: widget!.productRef?.sellerId == currentUserUid,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2cgxm0o7' /* Télécharge la photo */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 17.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PICTURE_GALLERY_Icon_nluzakok_ON_TAP');
                            logFirebaseEvent('Icon_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 1000.00,
                              maxHeight: 1000.00,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
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
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            logFirebaseEvent('Icon_backend_call');

                            await widget!.productRef!.reference
                                .update(createProductsRecordData(
                              photos: _model.uploadedFileUrl,
                              productId: widget!.productRef?.productId,
                              sellerId: widget!.productRef?.sellerId,
                            ));
                            logFirebaseEvent('Icon_backend_call');

                            await PhotosProductRecord.createDoc(
                                    widget!.productRef!.reference)
                                .set({
                              ...createPhotosProductRecordData(
                                photosUrl: _model.uploadedFileUrl,
                                productId: widget!.productRef?.productId,
                                sellerId: widget!.productRef?.sellerId,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_time': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          },
                          child: Icon(
                            Icons.upload,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            -1.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GradientText(
                                    FFLocalizations.of(context).getText(
                                      'i6oelnnp' /* Gallery de photos */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
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
                            ),
                            Container(
                              width: 396.0,
                              height: 446.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: StreamBuilder<List<PhotosProductRecord>>(
                                  stream: queryPhotosProductRecord(
                                    queryBuilder: (photosProductRecord) =>
                                        photosProductRecord.where(
                                      'productId',
                                      isEqualTo: widget!.productRef?.productId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PhotosProductRecord>
                                        gridViewPhotosProductRecordList =
                                        snapshot.data!;
                                    if (gridViewPhotosProductRecordList
                                        .isEmpty) {
                                      return Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        ),
                                      );
                                    }

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2.0,
                                        mainAxisSpacing: 1.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: gridViewPhotosProductRecordList
                                          .length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewPhotosProductRecord =
                                            gridViewPhotosProductRecordList[
                                                gridViewIndex];
                                        return Container(
                                          width: 245.0,
                                          height: 117.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PICTURE_GALLERY_Image_yxscg8yq_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'Grow_up_Picture',
                                                    queryParameters: {
                                                      'productRef':
                                                          serializeParam(
                                                        widget!.productRef,
                                                        ParamType.Document,
                                                      ),
                                                      'photosProductRef':
                                                          serializeParam(
                                                        gridViewPhotosProductRecord,
                                                        ParamType.Document,
                                                      ),
                                                      'uploapGownPicture':
                                                          serializeParam(
                                                        _model.uploadedFileUrl,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'productRef':
                                                          widget!.productRef,
                                                      'photosProductRef':
                                                          gridViewPhotosProductRecord,
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .bottomToTop,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      gridViewPhotosProductRecord
                                                          .photosUrl,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      gridViewPhotosProductRecord
                                                          .photosUrl,
                                                      width: 300.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (widget!
                                                      .productRef?.sellerId ==
                                                  currentUserUid)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PICTURE_GALLERY_Icon_8q7phe3o_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');

                                                        await widget!
                                                            .productRef!
                                                            .reference
                                                            .update(
                                                                createProductsRecordData(
                                                          photos:
                                                              gridViewPhotosProductRecord
                                                                  .photosUrl,
                                                        ));
                                                        logFirebaseEvent(
                                                            'Icon_navigate_back');
                                                        context.safePop();
                                                      },
                                                      child: Icon(
                                                        Icons.person_2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PICTURE_GALLERY_Icon_a3ifc0q0_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_navigate_to');

                                                        context.pushNamed(
                                                          'Grow_up_Picture',
                                                          queryParameters: {
                                                            'productRef':
                                                                serializeParam(
                                                              widget!
                                                                  .productRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'photosProductRef':
                                                                serializeParam(
                                                              gridViewPhotosProductRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'uploapGownPicture':
                                                                serializeParam(
                                                              _model
                                                                  .uploadedFileUrl,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'productRef':
                                                                widget!
                                                                    .productRef,
                                                            'photosProductRef':
                                                                gridViewPhotosProductRecord,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.zoom_in,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'PICTURE_GALLERY_Icon_fpbqxeo7_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_delete_data');
                                                        await FirebaseStorage
                                                            .instance
                                                            .refFromURL(
                                                                valueOrDefault<
                                                                    String>(
                                                              gridViewPhotosProductRecord
                                                                  .photosUrl,
                                                              '-',
                                                            ))
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');
                                                        await gridViewPhotosProductRecord
                                                            .reference
                                                            .delete();
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
