import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gravar_video_widget.dart' show GravarVideoWidget;
import 'package:flutter/material.dart';

class GravarVideoModel extends FlutterFlowModel<GravarVideoWidget> {
  ///  Local state fields for this page.

  bool? isFront;

  FFUploadedFile? testeArquivo;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - uploadedFileToBase64] action in CameraVideo widget.
  String? videoProvaVida;
  // Stores action output result for [Backend Call - API (documentosTesteDeVida)] action in CameraVideo widget.
  ApiCallResponse? apiResulttjz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
