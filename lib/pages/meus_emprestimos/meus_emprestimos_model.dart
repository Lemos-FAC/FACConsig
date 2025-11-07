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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (contratos)] action in MeusEmprestimos widget.
  ApiCallResponse? contratos;
  // Stores action output result for [Backend Call - API (contrato)] action in Button widget.
  ApiCallResponse? contratoPDF;
  // Stores action output result for [Custom Action - base64UploadedFile] action in Button widget.
  FFUploadedFile? pdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
