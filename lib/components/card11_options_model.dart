import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card11_options_widget.dart' show Card11OptionsWidget;
import 'package:flutter/material.dart';

class Card11OptionsModel extends FlutterFlowModel<Card11OptionsWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? documento;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_identificacao = false;
  FFUploadedFile uploadedLocalFile_identificacao =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file0;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? apiResultcqf;
  bool isDataUploading_comprovanteResidencia = false;
  FFUploadedFile uploadedLocalFile_comprovanteResidencia =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file1;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc1;
  bool isDataUploading_pad = false;
  FFUploadedFile uploadedLocalFile_pad =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file2;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc2;
  bool isDataUploading_comprovanteContaBancaria = false;
  FFUploadedFile uploadedLocalFile_comprovanteContaBancaria =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file3;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc3;
  bool isDataUploading_contraCheque = false;
  FFUploadedFile uploadedLocalFile_contraCheque =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file4;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc4;
  bool isDataUploading_detalhamentoRecompra = false;
  FFUploadedFile uploadedLocalFile_detalhamentoRecompra =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file5;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc5;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
