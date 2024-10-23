import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'traitement_offre_recue_widget.dart' show TraitementOffreRecueWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TraitementOffreRecueModel
    extends FlutterFlowModel<TraitementOffreRecueWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for StatutOfferReceived widget.
  String? statutOfferReceivedValue;
  FormFieldController<String>? statutOfferReceivedValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
