import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'anexar_doc_widget.dart' show AnexarDocWidget;
import 'package:flutter/material.dart';

class AnexarDocModel extends FlutterFlowModel<AnexarDocWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? documento;

  bool submetidoIdentificacao = true;

  bool submetidoComprovante = true;

  bool submetidoPAD = true;

  bool submetidoContaBancaria = true;

  bool submetidoContraCheque = true;

  bool submetidoRecompra = true;

  bool submetidoAutorizacaoDesconto = true;

  List<dynamic> docs = [];
  void addToDocs(dynamic item) => docs.add(item);
  void removeFromDocs(dynamic item) => docs.remove(item);
  void removeAtIndexFromDocs(int index) => docs.removeAt(index);
  void insertAtIndexInDocs(int index, dynamic item) => docs.insert(index, item);
  void updateDocsAtIndex(int index, Function(dynamic) updateFn) =>
      docs[index] = updateFn(docs[index]);

  int? propostaCod;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (documentosPendentes)] action in AnexarDoc widget.
  ApiCallResponse? checkUploadArquivo;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (atualizaMultiplosDocumentosCodigo)] action in Button widget.
  ApiCallResponse? enviaDocumento;
  // Stores action output result for [Backend Call - API (documentosPendentes)] action in Button widget.
  ApiCallResponse? checkUploadArquivo2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
