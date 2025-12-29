import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String margemDisponivel = '0,00';

  bool hideShow = true;

  String nomeContratente = '-';

  String cpfContratante = '00.000.000-00';

  bool canTap = true;

  String? margemTotal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DadosContratante)] action in HomePage widget.
  ApiCallResponse? contratante;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in HomePage widget.
  ApiCallResponse? home;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for margemTotal widget.
  FocusNode? margemTotalFocusNode;
  TextEditingController? margemTotalTextController;
  late bool margemTotalVisibility;
  String? Function(BuildContext, String?)? margemTotalTextControllerValidator;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Backend Call - API (buscaNotificacoes)] action in RichText widget.
  ApiCallResponse? notificacao;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in DropDown widget.
  ApiCallResponse? mudaContratante;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    margemTotalVisibility = false;
    columnController = ScrollController();
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    margemTotalFocusNode?.dispose();
    margemTotalTextController?.dispose();

    columnController?.dispose();
  }
}
