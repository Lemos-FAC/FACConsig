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

  bool valorVisivel = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DadosContratante)] action in HomePage widget.
  ApiCallResponse? contratante;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in HomePage widget.
  ApiCallResponse? home;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (simulaEmprestimoConsig)] action in DropDown widget.
  ApiCallResponse? mudaContratante;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
