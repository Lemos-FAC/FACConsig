import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'conta_widget.dart' show ContaWidget;
import 'package:flutter/material.dart';

class ContaModel extends FlutterFlowModel<ContaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Stores action output result for [Backend Call - API (excluirConta)] action in Button widget.
  ApiCallResponse? desativarConta;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
