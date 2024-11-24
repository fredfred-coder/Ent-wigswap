import 'package:flutter/material.dart';
import 'auth2_create_widget.dart' show Auth2CreateWidget;

class Auth2CreateModel extends FlutterFlowModel<Auth2CreateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  bool passwordVisibility = false; // Initialisation de la visibilité du mot de passe.
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  /// Constructor
  Auth2CreateModel() {
    passwordVisibility = false; // Initialisation par défaut.
  }

  /// Dispose method to properly clean up the controllers and focus nodes.
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}

