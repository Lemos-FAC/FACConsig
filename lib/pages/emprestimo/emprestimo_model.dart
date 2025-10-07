import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'emprestimo_widget.dart' show EmprestimoWidget;
import 'package:flutter/material.dart';

class EmprestimoModel extends FlutterFlowModel<EmprestimoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in Emprestimo widget.
  ApiCallResponse? dados;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in Slider widget.
  ApiCallResponse? valor;
  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in Slider widget.
  ApiCallResponse? vlrSolicitadoMenor;
  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in Slider widget.
  ApiCallResponse? vlrSolicitado;
  // State field(s) for total widget.
  FocusNode? totalFocusNode;
  TextEditingController? totalTextController;
  String? Function(BuildContext, String?)? totalTextControllerValidator;
  // State field(s) for valorParcelas widget.
  FocusNode? valorParcelasFocusNode;
  TextEditingController? valorParcelasTextController;
  String? Function(BuildContext, String?)? valorParcelasTextControllerValidator;
  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in valorParcelas widget.
  ApiCallResponse? valorParcela;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (SimulaEmprestimo)] action in DropDown widget.
  ApiCallResponse? qtdParcelas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    totalFocusNode?.dispose();
    totalTextController?.dispose();

    valorParcelasFocusNode?.dispose();
    valorParcelasTextController?.dispose();
  }
}
