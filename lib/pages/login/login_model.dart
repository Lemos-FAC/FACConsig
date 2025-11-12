import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  String? cpf;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Favor informe o CPF!';
    }

    if (!RegExp('^\\d{3}\\.\\d{3}\\.\\d{3}\\-\\d{2}\$').hasMatch(val)) {
      return 'Fomato inválido!';
    }
    return null;
  }

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  String? _senhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Favor informe a Senha!';
    }

    return null;
  }

  // State field(s) for cpfToggle widget.
  bool? cpfToggleValue;
  // State field(s) for biometria widget.
  bool? biometriaValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validate;
  // Stores action output result for [Backend Call - API (autenticacaoConsig)] action in Button widget.
  ApiCallResponse? login;
  bool biometria = false;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    cpfTextControllerValidator = _cpfTextControllerValidator;
    senhaVisibility = false;
    senhaTextControllerValidator = _senhaTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
