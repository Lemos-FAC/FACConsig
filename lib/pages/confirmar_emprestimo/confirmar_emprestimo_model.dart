import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmar_emprestimo_widget.dart' show ConfirmarEmprestimoWidget;
import 'package:flutter/material.dart';

class ConfirmarEmprestimoModel
    extends FlutterFlowModel<ConfirmarEmprestimoWidget> {
  ///  Local state fields for this page.

  List<String> fileOutputs = [];
  void addToFileOutputs(String item) => fileOutputs.add(item);
  void removeFromFileOutputs(String item) => fileOutputs.remove(item);
  void removeAtIndexFromFileOutputs(int index) => fileOutputs.removeAt(index);
  void insertAtIndexInFileOutputs(int index, String item) =>
      fileOutputs.insert(index, item);
  void updateFileOutputsAtIndex(int index, Function(String) updateFn) =>
      fileOutputs[index] = updateFn(fileOutputs[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (registraSimulacao)] action in Button widget.
  ApiCallResponse? confirmaEmprestimo;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
