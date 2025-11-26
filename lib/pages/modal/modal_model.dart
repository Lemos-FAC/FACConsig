import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_widget.dart' show ModalWidget;
import 'package:flutter/material.dart';

class ModalModel extends FlutterFlowModel<ModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_arquivoMidea = false;
  FFUploadedFile uploadedLocalFile_arquivoMidea =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in contentView_1 widget.
  String? arquivoMideaProcessado;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in contentView_1 widget.
  ApiCallResponse? retornoAPIArquivoMidea;
  bool isDataUploading_arquivo = false;
  FFUploadedFile uploadedLocalFile_arquivo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in contentView_1 widget.
  String? arquivoProcessado;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in contentView_1 widget.
  ApiCallResponse? retornoAPIArquivo;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
