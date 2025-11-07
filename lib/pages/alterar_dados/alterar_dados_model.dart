import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'alterar_dados_widget.dart' show AlterarDadosWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AlterarDadosModel extends FlutterFlowModel<AlterarDadosWidget> {
  ///  Local state fields for this page.

  String cep = '-';

  String endereco = '-';

  String bairro = '-';

  String uf = '-';

  String cidade = '-';

  String tipoConta = '-';

  List<dynamic> atualizados = [];
  void addToAtualizados(dynamic item) => atualizados.add(item);
  void removeFromAtualizados(dynamic item) => atualizados.remove(item);
  void removeAtIndexFromAtualizados(int index) => atualizados.removeAt(index);
  void insertAtIndexInAtualizados(int index, dynamic item) =>
      atualizados.insert(index, item);
  void updateAtualizadosAtIndex(int index, Function(dynamic) updateFn) =>
      atualizados[index] = updateFn(atualizados[index]);

  List<dynamic> dados = [];
  void addToDados(dynamic item) => dados.add(item);
  void removeFromDados(dynamic item) => dados.remove(item);
  void removeAtIndexFromDados(int index) => dados.removeAt(index);
  void insertAtIndexInDados(int index, dynamic item) =>
      dados.insert(index, item);
  void updateDadosAtIndex(int index, Function(dynamic) updateFn) =>
      dados[index] = updateFn(dados[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (dadosContratanteConsig)] action in AlterarDados widget.
  ApiCallResponse? result;
  // Stores action output result for [Backend Call - API (buscaBancos)] action in AlterarDados widget.
  ApiCallResponse? banco;
  // Stores action output result for [Backend Call - API (buscaBancos)] action in AlterarDados widget.
  ApiCallResponse? bancoRetorno;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for UF widget.
  String? ufValue;
  FormFieldController<String>? ufValueController;
  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  // State field(s) for CEP widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  late MaskTextInputFormatter cepMask;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // State field(s) for Bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroTextController;
  String? Function(BuildContext, String?)? bairroTextControllerValidator;
  // State field(s) for Endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoTextController;
  String? Function(BuildContext, String?)? enderecoTextControllerValidator;
  // State field(s) for Telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  late MaskTextInputFormatter telefoneMask;
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for DtaNascimento widget.
  FocusNode? dtaNascimentoFocusNode;
  TextEditingController? dtaNascimentoTextController;
  late MaskTextInputFormatter dtaNascimentoMask;
  String? Function(BuildContext, String?)? dtaNascimentoTextControllerValidator;
  // State field(s) for Banco widget.
  String? bancoValue;
  FormFieldController<String>? bancoValueController;
  // State field(s) for Agencia widget.
  FocusNode? agenciaFocusNode;
  TextEditingController? agenciaTextController;
  String? Function(BuildContext, String?)? agenciaTextControllerValidator;
  // State field(s) for Cont widget.
  FocusNode? contFocusNode;
  TextEditingController? contTextController;
  String? Function(BuildContext, String?)? contTextControllerValidator;
  // State field(s) for TipoConta widget.
  String? tipoContaValue;
  FormFieldController<String>? tipoContaValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? atualizaDados;
  // Stores action output result for [Backend Call - API (atualizaDados)] action in Button widget.
  ApiCallResponse? atualiza;
  // Stores action output result for [Backend Call - API (dadosContratanteConsig)] action in Button widget.
  ApiCallResponse? dadosAtualizados;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();

    bairroFocusNode?.dispose();
    bairroTextController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoTextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    dtaNascimentoFocusNode?.dispose();
    dtaNascimentoTextController?.dispose();

    agenciaFocusNode?.dispose();
    agenciaTextController?.dispose();

    contFocusNode?.dispose();
    contTextController?.dispose();
  }
}
