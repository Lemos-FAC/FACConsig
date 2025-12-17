import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'exibir_p_d_f_widget.dart' show ExibirPDFWidget;
import 'package:flutter/material.dart';

class ExibirPDFModel extends FlutterFlowModel<ExibirPDFWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> listpdfs = [];
  void addToListpdfs(FFUploadedFile item) => listpdfs.add(item);
  void removeFromListpdfs(FFUploadedFile item) => listpdfs.remove(item);
  void removeAtIndexFromListpdfs(int index) => listpdfs.removeAt(index);
  void insertAtIndexInListpdfs(int index, FFUploadedFile item) =>
      listpdfs.insert(index, item);
  void updateListpdfsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listpdfs[index] = updateFn(listpdfs[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
