import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'minhas_propostas_widget.dart' show MinhasPropostasWidget;
import 'package:flutter/material.dart';

class MinhasPropostasModel extends FlutterFlowModel<MinhasPropostasWidget> {
  ///  Local state fields for this page.

  String codigoProposta = '-';

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

  // Stores action output result for [Backend Call - API (propostas)] action in MinhasPropostas widget.
  ApiCallResponse? proposta;
  // Stores action output result for [Backend Call - API (documentosPendentes)] action in MinhasPropostas widget.
  ApiCallResponse? documentosPendentes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
