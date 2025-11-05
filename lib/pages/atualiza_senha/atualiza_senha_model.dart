import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'atualiza_senha_widget.dart' show AtualizaSenhaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AtualizaSenhaModel extends FlutterFlowModel<AtualizaSenhaWidget> {
  ///  Local state fields for this page.

  String? senha;

  String? confirmaSenha;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late MaskTextInputFormatter textFieldMask;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Favor inserir o CPF!';
    }

    if (!RegExp('^\\d{3}\\.\\d{3}\\.\\d{3}\\-\\d{2}\$').hasMatch(val)) {
      return 'Fomato inválido!';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? confirma;
  // Stores action output result for [Backend Call - API (recuperarSenha)] action in Button widget.
  ApiCallResponse? recuperaSenha;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
