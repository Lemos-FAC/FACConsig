import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_confirma_data_nascimento_widget.dart'
    show ModalConfirmaDataNascimentoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ModalConfirmaDataNascimentoModel
    extends FlutterFlowModel<ModalConfirmaDataNascimentoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for dataNascimento widget.
  FocusNode? dataNascimentoFocusNode;
  TextEditingController? dataNascimentoTextController;
  late MaskTextInputFormatter dataNascimentoMask;
  String? Function(BuildContext, String?)?
      dataNascimentoTextControllerValidator;
  // Stores action output result for [Backend Call - API (dadosContratanteConsig)] action in Button widget.
  ApiCallResponse? apiResulth9b;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dataNascimentoFocusNode?.dispose();
    dataNascimentoTextController?.dispose();
  }
}
