import '/flutter_flow/flutter_flow_util.dart';
import 'modal_widget.dart' show ModalWidget;
import 'package:flutter/material.dart';

class ModalModel extends FlutterFlowModel<ModalWidget> {
  ///  Local state fields for this component.

  String? arquivoPDF;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_arquivoMidia = false;
  List<FFUploadedFile> uploadedLocalFiles_arquivoMidia = [];

  bool isDataUploading_arquivo = false;
  List<FFUploadedFile> uploadedLocalFiles_arquivo = [];

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
