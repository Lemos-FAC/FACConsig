import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      _model.dados = await SimulaEmprestimoCall.call(
        contratante: '21220',
        tipoSimulacao: 'processaSimulacao',
        quantidadeParcelas: '0',
        valorEmprestimo: '0',
        valorParcelas: '0',
      );

      if ((_model.dados?.succeeded ?? true)) {
        FFAppState().totalParcela = getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..valorEmprestimoForma''',
        ).toString();
        FFAppState().valorParcela = getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..valorParcela''',
        ).toString();
        FFAppState().parcela = getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..parcelasMaximas''',
        ).toString();
        FFAppState().valorSlider = functions.stringDoubleSFomart(getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..valorEmprestimo''',
        ).toString())!;
        FFAppState().customSliderValue =
            functions.stringDoubleSFomart(getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..valorEmprestimo''',
        ).toString())!;
        safeSetState(() {});
        FFAppState().lastSliderRequestTime = DateTime.now();
        safeSetState(() {});
        safeSetState(() {
          _model.totalTextController?.text = FFAppState().totalParcela;
        });
        safeSetState(() {
          _model.valorParcelasTextController?.text = FFAppState().valorParcela;
        });
        safeSetState(() {
          _model.sliderValue = FFAppState().valorSlider;
        });
        await actions.generateNumberRangeAction(
          getJsonField(
            (_model.dados?.jsonBody ?? ''),
            r'''$..parcelasMinimas''',
          ).toString(),
          getJsonField(
            (_model.dados?.jsonBody ?? ''),
            r'''$..parcelasMaximas''',
          ).toString(),
        );
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Erro!'),
              content: Text(
                  'API erro: ${(_model.dados?.statusCode ?? 200).toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.totalTextController ??= TextEditingController();
    _model.totalFocusNode ??= FocusNode();

    _model.valorParcelasTextController ??= TextEditingController();
    _model.valorParcelasFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      future: SimulaEmprestimoCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  context.pop();
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 700.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.71, -0.73),
                            child: Text(
                              'Qual o valor desejado?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 145.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 70.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveColor: Color(0xFF97BBA7),
                                      min: 0.0,
                                      max: valueOrDefault<double>(
                                        FFAppState().valorSlider,
                                        0.0,
                                      ),
                                      value: _model.sliderValue ??=
                                          FFAppState().valorSlider,
                                      onChanged: (newValue) {
                                        newValue = double.parse(
                                            newValue.toStringAsFixed(2));
                                        safeSetState(() =>
                                            _model.sliderValue = newValue);
                                      },
                                      onChangeEnd: (newValue) async {
                                        newValue = double.parse(
                                            newValue.toStringAsFixed(2));
                                        safeSetState(() =>
                                            _model.sliderValue = newValue);
                                        if (FFAppState().hasChanged == true) {
                                          if (_model.sliderValue! >
                                              FFAppState().prevSlider) {
                                            safeSetState(() {
                                              _model.sliderValue =
                                                  FFAppState().prevSlider;
                                            });
                                            safeSetState(() {
                                              _model.totalTextController?.text =
                                                  formatNumber(
                                                FFAppState().prevSlider,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.commaDecimal,
                                                currency: 'R\$',
                                              );
                                            });
                                            _model.valor =
                                                await SimulaEmprestimoCall.call(
                                              contratante: '21220',
                                              tipoSimulacao:
                                                  'porValorSolicitado',
                                              quantidadeParcelas:
                                                  _model.dropDownValue,
                                              valorEmprestimo: _model
                                                  .sliderValue
                                                  ?.toString(),
                                              valorParcelas: '0',
                                            );

                                            if ((_model.valor?.succeeded ??
                                                true)) {
                                              FFAppState().valorParcela =
                                                  getJsonField(
                                                (_model.valor?.jsonBody ?? ''),
                                                r'''$..valorParcela''',
                                              ).toString();
                                              FFAppState().totalParcela =
                                                  getJsonField(
                                                (_model.valor?.jsonBody ?? ''),
                                                r'''$..valorEmprestimoForma''',
                                              ).toString();
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.totalTextController
                                                        ?.text =
                                                    FFAppState().totalParcela;
                                              });
                                              safeSetState(() {
                                                _model.valorParcelasTextController
                                                        ?.text =
                                                    FFAppState().valorParcela;
                                              });
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Erro!'),
                                                    content: Text(
                                                        'API(valor) erro: ${(_model.valor?.statusCode ?? 200).toString()}${_model.valorParcelasTextController.text}'),
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
                                            }
                                          } else {
                                            _model.vlrSolicitadoMenor =
                                                await SimulaEmprestimoCall.call(
                                              contratante: '21220',
                                              tipoSimulacao:
                                                  'porValorSolicitado',
                                              quantidadeParcelas:
                                                  _model.dropDownValue,
                                              valorEmprestimo: _model
                                                  .sliderValue
                                                  ?.toString(),
                                              valorParcelas: '0',
                                            );

                                            if ((_model.vlrSolicitadoMenor
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState().valorParcela =
                                                  getJsonField(
                                                (_model.vlrSolicitadoMenor
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$..valorParcela''',
                                              ).toString();
                                              FFAppState().totalParcela =
                                                  getJsonField(
                                                (_model.vlrSolicitadoMenor
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$..valorEmprestimoForma''',
                                              ).toString();
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.totalTextController
                                                        ?.text =
                                                    FFAppState().totalParcela;
                                              });
                                              safeSetState(() {
                                                _model.valorParcelasTextController
                                                        ?.text =
                                                    FFAppState().valorParcela;
                                              });
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Erro!'),
                                                    content: Text(
                                                        'API(vlrSolicitadoMenor) erro: ${(_model.vlrSolicitadoMenor?.statusCode ?? 200).toString()}'),
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
                                            }
                                          }
                                        } else {
                                          _model.response = await actions
                                              .postSliderValueThrottled(
                                            _model.sliderValue!,
                                            FFAppState().parcela,
                                            'porValorSolicitado',
                                            '21220',
                                          );
                                          if (functions.stringDoubleSFomart(
                                                  getJsonField(
                                                _model.response,
                                                r'''$.status''',
                                              ).toString()) ==
                                              200.0) {
                                            FFAppState().lastSliderRequestTime =
                                                DateTime.now();
                                            safeSetState(() {});
                                            FFAppState().valorParcela =
                                                getJsonField(
                                              _model.response,
                                              r'''$.body.dados.valorParcela''',
                                            ).toString();
                                            FFAppState().totalParcela =
                                                getJsonField(
                                              _model.response,
                                              r'''$.body.dados.valorEmprestimoForma''',
                                            ).toString();
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.totalTextController?.text =
                                                  FFAppState().totalParcela;
                                            });
                                            safeSetState(() {
                                              _model.valorParcelasTextController
                                                      ?.text =
                                                  FFAppState().valorParcela;
                                            });
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(_model.response!
                                                      .toString()),
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
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.75, -0.41),
                            child: Text(
                              'Parcelas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          Align(
                            alignment: AlignmentDirectional(0.5, -0.4),
                            child: Text(
                              'Valor Parcleas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          Align(
                            alignment: AlignmentDirectional(-0.08, -0.66),
                            child: Container(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.totalTextController,
                                focusNode: _model.totalFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.totalTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    FFAppState().valorSlider =
                                        functions.stringDoubleSFomart(
                                            _model.totalTextController.text)!;
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.sliderValue =
                                          FFAppState().valorSlider;
                                    });
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model.totalTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.87, -0.33),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 160.0,
                                child: TextFormField(
                                  controller:
                                      _model.valorParcelasTextController,
                                  focusNode: _model.valorParcelasFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.valorParcelasTextController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      if (functions.stringDoubleSFomart(_model
                                              .valorParcelasTextController
                                              .text)! >
                                          functions
                                              .stringDoubleSFomart(getJsonField(
                                            (_model.dados?.jsonBody ?? ''),
                                            r'''$..valorParcela''',
                                          ).toString())!) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Atenção!'),
                                              content: Text(
                                                  'Valor máximo permitido: ${getJsonField(
                                                (_model.dados?.jsonBody ?? ''),
                                                r'''$..valorParcela''',
                                              ).toString()}'),
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
                                        safeSetState(() {
                                          _model.valorParcelasTextController
                                              ?.text = getJsonField(
                                            (_model.dados?.jsonBody ?? ''),
                                            r'''$..valorParcela''',
                                          ).toString();
                                        });
                                      } else {
                                        _model.valorParcela =
                                            await SimulaEmprestimoCall.call(
                                          contratante: '21220',
                                          tipoSimulacao: 'porValorParcela',
                                          quantidadeParcelas: (_model
                                                  .dropDownValue!) ??
                                              getJsonField(
                                                (_model.dados?.jsonBody ?? ''),
                                                r'''$..parcelasMaximas''',
                                              ).toString(),
                                          valorEmprestimo: '0',
                                          valorParcelas: functions
                                              .stringDoubleSFomart(_model
                                                  .valorParcelasTextController
                                                  .text)
                                              ?.toString(),
                                        );

                                        if ((_model.valorParcela?.succeeded ??
                                            true)) {
                                          safeSetState(() {
                                            _model.totalTextController?.text =
                                                getJsonField(
                                              (_model.valorParcela?.jsonBody ??
                                                  ''),
                                              r'''$..valorEmprestimoForma''',
                                            ).toString();
                                          });
                                          safeSetState(() {
                                            _model.sliderValue = functions
                                                .stringDoubleSFomart(functions
                                                    .stringDoubleSFomart(
                                                        getJsonField(
                                                      (_model.valorParcela
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$..valorEmprestimo''',
                                                    ).toString())!
                                                    .toString())!;
                                          });
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Erro!'),
                                                content: Text(
                                                    'API erro: ${(_model.valorParcela?.statusCode ?? 200).toString()}'),
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
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
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
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .valorParcelasTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.82, -0.32),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: FFAppState().dropDownList,
                              onChanged: (val) async {
                                safeSetState(() => _model.dropDownValue = val);
                                _model.qtdParcelas =
                                    await SimulaEmprestimoCall.call(
                                  contratante: '21220',
                                  tipoSimulacao: 'porQtdeParcelas',
                                  quantidadeParcelas: _model.dropDownValue,
                                  valorEmprestimo:
                                      _model.sliderValue?.toString(),
                                  valorParcelas: '0',
                                );

                                if ((_model.qtdParcelas?.succeeded ?? true)) {
                                  safeSetState(() {
                                    _model.totalTextController?.text =
                                        getJsonField(
                                      (_model.qtdParcelas?.jsonBody ?? ''),
                                      r'''$..valorEmprestimoForma''',
                                    ).toString();
                                  });
                                  safeSetState(() {
                                    _model.sliderValue = functions
                                        .stringDoubleSFomart(getJsonField(
                                      (_model.qtdParcelas?.jsonBody ?? ''),
                                      r'''$..valorEmprestimo''',
                                    ).toString())!;
                                  });
                                  safeSetState(() {
                                    _model.valorParcelasTextController?.text =
                                        getJsonField(
                                      (_model.qtdParcelas?.jsonBody ?? ''),
                                      r'''$..valorParcela''',
                                    ).toString();
                                  });
                                  FFAppState().hasChanged = true;
                                  safeSetState(() {});
                                  FFAppState().prevSlider = functions
                                      .stringDoubleSFomart(getJsonField(
                                    (_model.qtdParcelas?.jsonBody ?? ''),
                                    r'''$..valorEmprestimo''',
                                  ).toString())!;
                                  safeSetState(() {});
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Erro!'),
                                        content: Text(
                                            'API erro: ${(_model.qtdParcelas?.statusCode ?? 200).toString()}'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                safeSetState(() {});
                              },
                              width: 121.65,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                              hintText: FFAppState().parcela,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Quero Empréstimo',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.8,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.02, -0.11),
                            child: Text(
                              'Taxa de 2,2% A.M',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          Align(
                            alignment: AlignmentDirectional(-0.41, -0.12),
                            child: Icon(
                              Icons.info,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
