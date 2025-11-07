import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastra_senha_widget.dart' show CadastraSenhaWidget;
import 'package:flutter/material.dart';

class CadastraSenhaModel extends FlutterFlowModel<CadastraSenhaWidget> {
  ///  Local state fields for this page.

  String? senha;

  String? confirmaSenha;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Senha is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirmar senha is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? confirma;
  // Stores action output result for [Backend Call - API (cadastraSenha)] action in Button widget.
  ApiCallResponse? cadastraSenha;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    passwordVisibility1 = false;
    textController1Validator = _textController1Validator;
    passwordVisibility2 = false;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
