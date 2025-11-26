import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anexar_doc_copy2_widget.dart' show AnexarDocCopy2Widget;
import 'package:flutter/material.dart';

class AnexarDocCopy2Model extends FlutterFlowModel<AnexarDocCopy2Widget> {
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

  // Stores action output result for [Backend Call - API (documentosPendentes)] action in AnexarDocCopy2 widget.
  ApiCallResponse? checkUploadArquivo;
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
