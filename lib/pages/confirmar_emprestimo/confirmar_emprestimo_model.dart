import '/flutter_flow/flutter_flow_util.dart';
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
