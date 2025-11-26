import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anexar_doc_copy_widget.dart' show AnexarDocCopyWidget;
import 'package:flutter/material.dart';

class AnexarDocCopyModel extends FlutterFlowModel<AnexarDocCopyWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? documento;

  bool submetidoIdentificacao = true;

  bool submetidoComprovante = true;

  bool submetidoPAD = true;

  bool submetidoContaBancaria = true;

  bool submetidoContraCheque = true;

  bool submetidoRecompra = true;

  bool submetidoAutorizacaoDesconto = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (documentosPendentes)] action in AnexarDocCopy widget.
  ApiCallResponse? checkUploadArquivo;
  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_identificacao = false;
  FFUploadedFile uploadedLocalFile_identificacao =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file0;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc0;
  bool isDataUploading_comprovanteResidencia = false;
  FFUploadedFile uploadedLocalFile_comprovanteResidencia =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file1;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc1;
  bool isDataUploading_uploadDataPhi = false;
  FFUploadedFile uploadedLocalFile_uploadDataPhi =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file2;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc2;
  bool isDataUploading_uploadDataFf8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataFf8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file03;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc03;
  bool isDataUploading_uploadData64k = false;
  FFUploadedFile uploadedLocalFile_uploadData64k =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file04;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc04;
  bool isDataUploading_uploadData4yz = false;
  FFUploadedFile uploadedLocalFile_uploadData4yz =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file05;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc05;
  bool isDataUploading_uploadDataGf5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataGf5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in IconButton widget.
  String? file06;
  // Stores action output result for [Backend Call - API (enviaDocumento)] action in IconButton widget.
  ApiCallResponse? doc06;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
