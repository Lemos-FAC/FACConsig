import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'meus_emprestimos_widget.dart' show MeusEmprestimosWidget;
import 'package:flutter/material.dart';

class MeusEmprestimosModel extends FlutterFlowModel<MeusEmprestimosWidget> {
  ///  Local state fields for this page.

  String codigoContrato = '-';

  String status = '-';

  String total = '-';

  String parcela = '-';

  String qtdParcelas = '-';

  String data = '-';

  List<dynamic> dados = [];
  void addToDados(dynamic item) => dados.add(item);
  void removeFromDados(dynamic item) => dados.remove(item);
  void removeAtIndexFromDados(int index) => dados.removeAt(index);
  void insertAtIndexInDados(int index, dynamic item) =>
      dados.insert(index, item);
  void updateDadosAtIndex(int index, Function(dynamic) updateFn) =>
      dados[index] = updateFn(dados[index]);

  String? pesquisa = '';

  List<dynamic> contratosLista = [];
  void addToContratosLista(dynamic item) => contratosLista.add(item);
  void removeFromContratosLista(dynamic item) => contratosLista.remove(item);
  void removeAtIndexFromContratosLista(int index) =>
      contratosLista.removeAt(index);
  void insertAtIndexInContratosLista(int index, dynamic item) =>
      contratosLista.insert(index, item);
  void updateContratosListaAtIndex(int index, Function(dynamic) updateFn) =>
      contratosLista[index] = updateFn(contratosLista[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contratos)] action in MeusEmprestimos widget.
  ApiCallResponse? contratos;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (contrato)] action in Button widget.
  ApiCallResponse? contratoPDF;
  // Stores action output result for [Custom Action - base64UploadedFile] action in Button widget.
  FFUploadedFile? pdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
