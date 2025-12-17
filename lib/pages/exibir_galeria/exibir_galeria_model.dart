import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'exibir_galeria_widget.dart' show ExibirGaleriaWidget;
import 'package:flutter/material.dart';

class ExibirGaleriaModel extends FlutterFlowModel<ExibirGaleriaWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> listGaleria = [];
  void addToListGaleria(FFUploadedFile item) => listGaleria.add(item);
  void removeFromListGaleria(FFUploadedFile item) => listGaleria.remove(item);
  void removeAtIndexFromListGaleria(int index) => listGaleria.removeAt(index);
  void insertAtIndexInListGaleria(int index, FFUploadedFile item) =>
      listGaleria.insert(index, item);
  void updateListGaleriaAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listGaleria[index] = updateFn(listGaleria[index]);

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
