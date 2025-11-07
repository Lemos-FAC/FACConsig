import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emprestimo_model.dart';
export 'emprestimo_model.dart';

class EmprestimoWidget extends StatefulWidget {
  const EmprestimoWidget({super.key});

  static String routeName = 'Emprestimo';
  static String routePath = '/emprestimo';

  @override
  State<EmprestimoWidget> createState() => _EmprestimoWidgetState();
}

class _EmprestimoWidgetState extends State<EmprestimoWidget> {
  late EmprestimoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmprestimoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.home = await FACConsigGroup.simulaEmprestimoConsigCall.call(
        contratante: FFAppState().codigoContratante,
        tipoSimulacao: 'processaSimulacao',
        quantidadeParcelas: '0',
        valorEmprestimo: '0',
        valorParcelas: '0',
      );

      if (getJsonField(
        (_model.home?.jsonBody ?? ''),
        r'''$..status''',
      )) {
        FFAppState().totalParcela = getJsonField(
          (_model.home?.jsonBody ?? ''),
          r'''$..valorEmprestimoForma''',
        ).toString();
        FFAppState().valorParcela = getJsonField(
          (_model.home?.jsonBody ?? ''),
          r'''$..valorParcela''',
        ).toString();
        FFAppState().parcela = getJsonField(
          (_model.home?.jsonBody ?? ''),
          r'''$..parcelasMaximas''',
        ).toString();
        FFAppState().reajuste = getJsonField(
          (_model.home?.jsonBody ?? ''),
          r'''$..valorTotalEmprestimo''',
        ).toString();
        FFAppState().hasChanged = false;
        safeSetState(() {});
        safeSetState(() {
          _model.valorParcelaTextController?.text = FFAppState().valorParcela;
        });
        safeSetState(() {
          _model.totalTextController?.text = FFAppState().totalParcela;
        });
        await actions.generateNumberRangeAction(
          getJsonField(
            (_model.home?.jsonBody ?? ''),
            r'''$..parcelasMinimas''',
          ).toString(),
          getJsonField(
            (_model.home?.jsonBody ?? ''),
            r'''$..parcelasMaximas''',
          ).toString(),
        );
      }
    });

    _model.totalTextController ??= TextEditingController(
        text: formatNumber(
      functions.stringDoubleSFomart(FFAppState().totalParcela),
      formatType: FormatType.custom,
      currency: 'R\$',
      format: '#,##0.00',
      locale: 'pt_BR',
    ));
    _model.totalFocusNode ??= FocusNode();
    _model.totalFocusNode!.addListener(
      () async {
        FFAppState().hasChanged = true;
        safeSetState(() {});
        _model.apiResultl9cCopy =
            await FACConsigGroup.simulaEmprestimoConsigCall.call(
          contratante: FFAppState().codigoContratante,
          tipoSimulacao: 'porValorSolicitado',
          quantidadeParcelas: FFAppState().parcela,
          valorEmprestimo: functions
              .stringDoubleSFomart(_model.totalTextController.text)
              ?.toString(),
          valorParcelas: '0',
        );

        if ((_model.apiResultl9cCopy?.succeeded ?? true)) {
          if ((String var1) {
            return var1 != "";
          }(getJsonField(
            (_model.apiResultl9cCopy?.jsonBody ?? ''),
            r'''$..alerta''',
          ).toString())) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Atenção!'),
                  content: Text(getJsonField(
                    (_model.apiResultl9cCopy?.jsonBody ?? ''),
                    r'''$..alerta''',
                  ).toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
            FFAppState().totalParcela = getJsonField(
              (_model.apiResultl9cCopy?.jsonBody ?? ''),
              r'''$..valorEmprestimoForma''',
            ).toString();
            FFAppState().hasChanged = false;
            safeSetState(() {});
            safeSetState(() {
              _model.totalTextController?.text = FFAppState().totalParcela;
            });
            FFAppState().hasChanged = true;
            safeSetState(() {});
            _model.total2Copy =
                await FACConsigGroup.simulaEmprestimoConsigCall.call(
              contratante: FFAppState().codigoContratante,
              tipoSimulacao: 'porValorSolicitado',
              quantidadeParcelas: _model.parcelasValue,
              valorEmprestimo: functions
                  .stringDoubleSFomart(_model.totalTextController.text)
                  ?.toString(),
              valorParcelas: '0',
            );

            if ((_model.total2Copy?.succeeded ?? true)) {
              FFAppState().valorParcela = getJsonField(
                (_model.total2Copy?.jsonBody ?? ''),
                r'''$..valorParcela''',
              ).toString();
              FFAppState().reajuste = getJsonField(
                (_model.total2Copy?.jsonBody ?? ''),
                r'''$..valorTotalEmprestimo''',
              ).toString();
              safeSetState(() {});
              safeSetState(() {
                _model.valorParcelaTextController?.text =
                    FFAppState().valorParcela;
              });
            }
            FFAppState().hasChanged = false;
            safeSetState(() {});
          } else {
            FFAppState().valorParcela = getJsonField(
              (_model.apiResultl9cCopy?.jsonBody ?? ''),
              r'''$..valorParcela''',
            ).toString();
            FFAppState().reajuste = getJsonField(
              (_model.apiResultl9cCopy?.jsonBody ?? ''),
              r'''$..valorTotalEmprestimo''',
            ).toString();
            safeSetState(() {});
            safeSetState(() {
              _model.valorParcelaTextController?.text =
                  FFAppState().valorParcela;
            });
          }

          FFAppState().hasChanged = false;
          safeSetState(() {});
        }

        safeSetState(() {});
      },
    );
    _model.valorParcelaTextController ??= TextEditingController(
        text: formatNumber(
      functions.stringDoubleSFomart(FFAppState().valorParcela),
      formatType: FormatType.custom,
      currency: 'R\$',
      format: '#,##0.00',
      locale: 'pt_BR',
    ));
    _model.valorParcelaFocusNode ??= FocusNode();
    _model.valorParcelaFocusNode!.addListener(
      () async {
        FFAppState().hasChanged = true;
        safeSetState(() {});
        _model.apiResultrqrCopy =
            await FACConsigGroup.simulaEmprestimoConsigCall.call(
          contratante: FFAppState().codigoContratante,
          tipoSimulacao: 'porValorParcela',
          quantidadeParcelas: FFAppState().parcela,
          valorEmprestimo: '0',
          valorParcelas: functions
              .stringDoubleSFomart(_model.valorParcelaTextController.text)
              ?.toString(),
        );

        if ((_model.apiResultrqrCopy?.succeeded ?? true)) {
          if ((String var1) {
            return var1 != "";
          }(getJsonField(
            (_model.apiResultrqrCopy?.jsonBody ?? ''),
            r'''$..alerta''',
          ).toString())) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Atenção!'),
                  content: Text(getJsonField(
                    (_model.apiResultrqrCopy?.jsonBody ?? ''),
                    r'''$..alerta''',
                  ).toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
            FFAppState().valorParcela = getJsonField(
              (_model.home?.jsonBody ?? ''),
              r'''$..valorParcela''',
            ).toString();
            FFAppState().reajuste = getJsonField(
              (_model.apiResultrqrCopy?.jsonBody ?? ''),
              r'''$..valorTotalEmprestimo''',
            ).toString();
            FFAppState().hasChanged = false;
            safeSetState(() {});
            safeSetState(() {
              _model.valorParcelaTextController?.text =
                  FFAppState().valorParcela;
            });
          } else {
            FFAppState().totalParcela = getJsonField(
              (_model.apiResultrqrCopy?.jsonBody ?? ''),
              r'''$..valorEmprestimoForma''',
            ).toString();
            FFAppState().reajuste = getJsonField(
              (_model.apiResultrqrCopy?.jsonBody ?? ''),
              r'''$..valorTotalEmprestimo''',
            ).toString();
            safeSetState(() {});
            safeSetState(() {
              _model.totalTextController?.text = FFAppState().totalParcela;
            });
          }

          FFAppState().hasChanged = false;
          safeSetState(() {});
        }
        FFAppState().hasChanged = false;
        safeSetState(() {});

        safeSetState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: SimulaEmprestimoCall.call(
        contratante: '21220',
        tipoSimulacao: 'processaSimulacao',
        quantidadeParcelas: '0',
        valorEmprestimo: '0',
        valorParcelas: '0',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final emprestimoSimulaEmprestimoResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                'Empréstimo Consignado',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 567.5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F5F7),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.55, -0.88),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 45.0, 0.0, 0.0),
                                child: Text(
                                  'Simule e solicite seu crédito',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 110.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.7, -0.75),
                                    child: Text(
                                      'Qual o valor desejado?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.66),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          29.0, 0.0, 30.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.totalTextController,
                                          focusNode: _model.totalFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.totalTextController',
                                            Duration(milliseconds: 0),
                                            () async {
                                              _model.totalTextController?.text =
                                                  functions.converterParaMoeda(
                                                      _model.totalTextController
                                                          .text,
                                                      true)!;
                                              _model.totalFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.totalTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .totalTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            },
                                          ),
                                          autofocus: false,
                                          enabled: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFE6E6E6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            hoverColor: Colors.transparent,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .totalTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.03, 0.65),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 500.0, 30.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      ConfirmarEmprestimoWidget.routeName,
                                      queryParameters: {
                                        'valorSolicitado': serializeParam(
                                          _model.totalTextController.text,
                                          ParamType.String,
                                        ),
                                        'parcelas': serializeParam(
                                          FFAppState().parcela,
                                          ParamType.String,
                                        ),
                                        'taxaJuros': serializeParam(
                                          getJsonField(
                                            (_model.home?.jsonBody ?? ''),
                                            r'''$..taxaEfetiva''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'valorPagar': serializeParam(
                                          FFAppState().reajuste,
                                          ParamType.String,
                                        ),
                                        'valor': serializeParam(
                                          _model
                                              .valorParcelaTextController.text,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Solicitar Crédito',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 200.0, 30.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.7, -0.33),
                                          child: Text(
                                            'Em quantas parcelas?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.85, -0.4),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .parcelasValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: FFAppState().dropDownList,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.parcelasValue = val);
                                              FFAppState().parcela =
                                                  _model.parcelasValue!;
                                              FFAppState().hasChanged = true;
                                              safeSetState(() {});
                                              await Future.delayed(
                                                Duration(
                                                  milliseconds: 2000,
                                                ),
                                              );
                                              _model.parcela =
                                                  await FACConsigGroup
                                                      .simulaEmprestimoConsigCall
                                                      .call(
                                                contratante: FFAppState()
                                                    .codigoContratante,
                                                tipoSimulacao:
                                                    'porQtdeParcelas',
                                                quantidadeParcelas:
                                                    _model.parcelasValue,
                                                valorEmprestimo: functions
                                                    .stringDoubleSFomart(_model
                                                        .totalTextController
                                                        .text)
                                                    ?.toString(),
                                                valorParcelas: '0',
                                              );

                                              if ((_model.parcela?.succeeded ??
                                                  true)) {
                                                if ((String var1) {
                                                  return var1 != "";
                                                }(getJsonField(
                                                  (_model.parcela?.jsonBody ??
                                                      ''),
                                                  r'''$..alerta''',
                                                ).toString())) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Atenção!'),
                                                        content:
                                                            Text(getJsonField(
                                                          (_model.parcela
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$..alerta''',
                                                        ).toString()),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  FFAppState().totalParcela =
                                                      getJsonField(
                                                    (_model.parcela?.jsonBody ??
                                                        ''),
                                                    r'''$..valorEmprestimoForma''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.totalTextController
                                                            ?.text =
                                                        FFAppState()
                                                            .totalParcela;
                                                  });
                                                  _model.parcela2 =
                                                      await FACConsigGroup
                                                          .simulaEmprestimoConsigCall
                                                          .call(
                                                    contratante: FFAppState()
                                                        .codigoContratante,
                                                    tipoSimulacao:
                                                        'porQtdeParcelas',
                                                    quantidadeParcelas:
                                                        getJsonField(
                                                      (_model.parcela
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$..qtdParcelaEmprestimo''',
                                                    ).toString(),
                                                    valorEmprestimo:
                                                        getJsonField(
                                                      (_model.parcela
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$..valorEmprestimo''',
                                                    ).toString(),
                                                  );

                                                  if ((_model.parcela2
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().valorParcela =
                                                        getJsonField(
                                                      (_model.parcela2
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$..valorParcela''',
                                                    ).toString();
                                                    FFAppState().reajuste =
                                                        getJsonField(
                                                      (_model.parcela2
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$..valorTotalEmprestimo''',
                                                    ).toString();
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model.valorParcelaTextController
                                                              ?.text =
                                                          FFAppState()
                                                              .valorParcela;
                                                    });
                                                  }
                                                } else {
                                                  FFAppState().valorParcela =
                                                      getJsonField(
                                                    (_model.parcela?.jsonBody ??
                                                        ''),
                                                    r'''$..valorParcela''',
                                                  ).toString();
                                                  FFAppState().reajuste =
                                                      getJsonField(
                                                    (_model.parcela?.jsonBody ??
                                                        ''),
                                                    r'''$..valorTotalEmprestimo''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.valorParcelaTextController
                                                            ?.text =
                                                        FFAppState()
                                                            .valorParcela;
                                                  });
                                                }

                                                FFAppState().hasChanged = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            width: 155.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: FFAppState().parcela,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Color(0xFFE6E6E6),
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Valor da parcela',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.86, -0.4),
                                          child: Container(
                                            width: 155.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .valorParcelaTextController,
                                              focusNode:
                                                  _model.valorParcelaFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.valorParcelaTextController',
                                                Duration(milliseconds: 0),
                                                () async {
                                                  safeSetState(() {
                                                    _model.valorParcelaTextController
                                                            ?.text =
                                                        functions
                                                            .converterParaMoeda(
                                                                _model
                                                                    .valorParcelaTextController
                                                                    .text,
                                                                true)!;
                                                    _model.valorParcelaFocusNode
                                                        ?.requestFocus();
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {
                                                      _model.valorParcelaTextController
                                                              ?.selection =
                                                          TextSelection
                                                              .collapsed(
                                                        offset: _model
                                                            .valorParcelaTextController!
                                                            .text
                                                            .length,
                                                      );
                                                    });
                                                  });
                                                },
                                              ),
                                              autofocus: false,
                                              enabled: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                alignLabelWithHint: false,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE6E6E6),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                hoverColor: Colors.transparent,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .valorParcelaTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.77),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 563.0, 0.0, 0.0),
                                child: Text(
                                  'Valores podem variar após analise. Sujeito à aprovação.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, -0.9),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 45.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.restart_alt_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    FFAppState().parcela = getJsonField(
                                      (_model.home?.jsonBody ?? ''),
                                      r'''$..parcelasMaximas''',
                                    ).toString();
                                    FFAppState().valorParcela = getJsonField(
                                      (_model.home?.jsonBody ?? ''),
                                      r'''$..valorParcela''',
                                    ).toString();
                                    FFAppState().totalParcela = getJsonField(
                                      (_model.home?.jsonBody ?? ''),
                                      r'''$..valorEmprestimoForma''',
                                    ).toString();
                                    FFAppState().reajuste = getJsonField(
                                      (_model.home?.jsonBody ?? ''),
                                      r'''$..valorTotalEmprestimo''',
                                    ).toString();
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.totalTextController?.text =
                                          FFAppState().totalParcela;
                                    });
                                    safeSetState(() {
                                      _model.valorParcelaTextController?.text =
                                          FFAppState().valorParcela;
                                    });
                                    safeSetState(() {
                                      _model.parcelasValueController?.value =
                                          FFAppState().parcela;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.37, 0.45),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 470.0, 20.0, 0.0),
                                child: Text(
                                  'Simulação segura e sem compromisso',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.79, 0.45),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 470.0, 105.0, 0.0),
                                child: Icon(
                                  Icons.card_travel,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 300.0, 30.0, 100.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 146.1,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.83, -0.02),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 366.0, 30.0, 100.0),
                                child: Text(
                                  'Taxa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.76, -0.13),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 330.0, 30.0, 100.0),
                                child: Text(
                                  'Valor total com juros',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0.11),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 400.0, 30.0, 100.0),
                                child: Text(
                                  'CET estimado',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.81, -0.13),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 330.0, 30.0, 100.0),
                                child: Text(
                                  FFAppState().reajuste,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.83, -0.02),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 366.0, 30.0, 100.0),
                                child: Text(
                                  '${getJsonField(
                                    (_model.home?.jsonBody ?? ''),
                                    r'''$..taxaEfetiva''',
                                  ).toString()}.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.8, 0.11),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 400.0, 30.0, 100.0),
                                child: Text(
                                  '${getJsonField(
                                    (_model.home?.jsonBody ?? ''),
                                    r'''$..taxaEfetivaAnual''',
                                  ).toString()}a.a.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.88, -0.88),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 45.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.creditCard,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 19.0,
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              FFAppState().hasChanged == true,
                              true,
                            ))
                              Align(
                                alignment: AlignmentDirectional(0.03, -0.07),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 250.0, 0.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    child: custom_widgets.LoadingIndicator(
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
