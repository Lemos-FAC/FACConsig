import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'emprestimo_widget.dart' show EmprestimoWidget;
import 'package:flutter/material.dart';

class EmprestimoModel extends FlutterFlowModel<EmprestimoWidget> {
  ///  Local state fields for this page.

  DateTime? lastSliderRequestTime;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in Emprestimo widget.
  ApiCallResponse? home;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for total widget.
  FocusNode? totalFocusNode;
  TextEditingController? totalTextController;
  String? Function(BuildContext, String?)? totalTextControllerValidator;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in total widget.
  ApiCallResponse? apiResultl9cCopyCopy;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in total widget.
  ApiCallResponse? total2CopyCopy;
  // State field(s) for parcelas widget.
  String? parcelasValue;
  FormFieldController<String>? parcelasValueController;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in parcelas widget.
  ApiCallResponse? parcela;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in parcelas widget.
  ApiCallResponse? parcela2;
  // State field(s) for valorParcela widget.
  FocusNode? valorParcelaFocusNode;
  TextEditingController? valorParcelaTextController;
  String? Function(BuildContext, String?)? valorParcelaTextControllerValidator;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in valorParcela widget.
  ApiCallResponse? apiResultrqrCopyCopy;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    totalFocusNode?.dispose();
    totalTextController?.dispose();

    valorParcelaFocusNode?.dispose();
    valorParcelaTextController?.dispose();
  }
}
