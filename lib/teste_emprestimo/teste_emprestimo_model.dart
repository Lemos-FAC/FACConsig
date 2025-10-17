import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'teste_emprestimo_widget.dart' show TesteEmprestimoWidget;
import 'package:flutter/material.dart';

class TesteEmprestimoModel extends FlutterFlowModel<TesteEmprestimoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Slider widget.
  double? sliderValue;
  InstantTimer? instantTimer;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    instantTimer?.cancel();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
