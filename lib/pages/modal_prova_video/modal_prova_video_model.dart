import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_prova_video_widget.dart' show ModalProvaVideoWidget;
import 'package:flutter/material.dart';

class ModalProvaVideoModel extends FlutterFlowModel<ModalProvaVideoWidget> {
  ///  Local state fields for this component.

  int? proposta;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData2ls = false;
  FFUploadedFile uploadedLocalFile_uploadData2ls =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in Button widget.
  String? fotoProvaVida;
  // Stores action output result for [Backend Call - API (documentosTesteDeVida)] action in Button widget.
  ApiCallResponse? apiResultz8a;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
