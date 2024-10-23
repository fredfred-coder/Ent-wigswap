import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'faire_une_offre_widget.dart' show FaireUneOffreWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaireUneOffreModel extends FlutterFlowModel<FaireUneOffreWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for offerPrice widget.
  FocusNode? offerPriceFocusNode;
  TextEditingController? offerPriceTextController;
  String? Function(BuildContext, String?)? offerPriceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    offerPriceFocusNode?.dispose();
    offerPriceTextController?.dispose();
  }
}
