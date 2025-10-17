import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'teste_model.dart';
export 'teste_model.dart';

class TesteWidget extends StatefulWidget {
  const TesteWidget({super.key});

  static String routeName = 'Teste';
  static String routePath = '/teste';

  @override
  State<TesteWidget> createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  late TesteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TesteModel());

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
        FFAppState().customSliderValue = FFAppState().valorSlider;
        FFAppState().totalParcela = getJsonField(
          (_model.dados?.jsonBody ?? ''),
          r'''$..valorEmprestimoForma''',
        ).toString();
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
        final testeSimulaEmprestimoResponse = snapshot.data!;

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
                            alignment: AlignmentDirectional(-0.72, -0.82),
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
                              'Valor Parcelas',
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
                              'Taxa de ${getJsonField(
                                (_model.dados?.jsonBody ?? ''),
                                r'''$..taxaEfetiva''',
                              ).toString()}',
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
                          Align(
                            alignment: AlignmentDirectional(0.09, -0.52),
                            child: Container(
                              width: 400.0,
                              height: 40.0,
                              child: custom_widgets.OnEndSlider(
                                width: 400.0,
                                height: 40.0,
                                min: 0.0,
                                max: FFAppState().valorSlider,
                                initialValue: FFAppState().customSliderValue,
                                onApiSuccess: (apiResponse) async {
                                  FFAppState().valorParcelaAlterado =
                                      apiResponse;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.04, -0.69),
                            child: Container(
                              width: 160.0,
                              height: 60.0,
                              child: custom_widgets.FormatacaoValores(
                                width: 160.0,
                                height: 60.0,
                                radius: 50.0,
                                cor: FlutterFlowTheme.of(context).primary,
                                initialText: FFAppState().totalParcela,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.9, -0.3),
                            child: Container(
                              width: 160.0,
                              height: 60.0,
                              child: custom_widgets.FormatacaoValoresTotal(
                                width: 160.0,
                                height: 60.0,
                                radius: 50.0,
                                cor: FlutterFlowTheme.of(context).primary,
                                initialText: FFAppState().valorParcela,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.81, -0.29),
                            child: Container(
                              width: 160.0,
                              height: 60.0,
                              child: custom_widgets.DynamicDropdownFF(
                                width: 160.0,
                                height: 60.0,
                                initialValue: getJsonField(
                                  (_model.dados?.jsonBody ?? ''),
                                  r'''$..parcelasMaximas''',
                                ).toString(),
                                options: FFAppState().dropDownList,
                              ),
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
