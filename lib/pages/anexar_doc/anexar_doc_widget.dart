import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/modal/modal_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'anexar_doc_model.dart';
export 'anexar_doc_model.dart';

class AnexarDocWidget extends StatefulWidget {
  const AnexarDocWidget({super.key});

  static String routeName = 'AnexarDoc';
  static String routePath = '/anexarDoc';

  @override
  State<AnexarDocWidget> createState() => _AnexarDocWidgetState();
}

class _AnexarDocWidgetState extends State<AnexarDocWidget> {
  late AnexarDocModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnexarDocModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkUploadArquivo =
          await FACConsigGroup.documentosPendentesCall.call(
        cpf: FFAppState().cpf,
      );

      if ((_model.checkUploadArquivo?.succeeded ?? true)) {
        _model.docs = getJsonField(
          (_model.checkUploadArquivo?.jsonBody ?? ''),
          r'''$.dados''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        for (int loop1Index = 0;
            loop1Index < _model.docs.length;
            loop1Index++) {
          final currentLoop1Item = _model.docs[loop1Index];
          if ((String var1) {
            return var1 == "S";
          }(getJsonField(
            currentLoop1Item,
            r'''$..obrigatorio''',
          ).toString())) {
            FFAppState().addToArquivosObrigatorios(getJsonField(
              currentLoop1Item,
              r'''$..codigo_documento''',
            ));
            safeSetState(() {});
          }
        }
        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[0].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[0].status_documento''',
            ).toString())) {
          _model.submetidoIdentificacao = true;
          safeSetState(() {});
        } else {
          _model.submetidoIdentificacao = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[1].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[1].status_documento''',
            ).toString())) {
          _model.submetidoComprovante = true;
          safeSetState(() {});
        } else {
          _model.submetidoComprovante = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[2].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[2].status_documento''',
            ).toString())) {
          _model.submetidoPAD = true;
          safeSetState(() {});
        } else {
          _model.submetidoPAD = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[3].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[3].status_documento''',
            ).toString())) {
          _model.submetidoAutorizacaoDesconto = true;
          safeSetState(() {});
        } else {
          _model.submetidoAutorizacaoDesconto = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[4].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[4].status_documento''',
            ).toString())) {
          _model.submetidoContaBancaria = true;
          safeSetState(() {});
        } else {
          _model.submetidoContaBancaria = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[5].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[5].status_documento''',
            ).toString())) {
          _model.submetidoContraCheque = true;
          safeSetState(() {});
        } else {
          _model.submetidoContraCheque = false;
          safeSetState(() {});
        }

        if ((String var1, String var2) {
          return var1 != "null" || var2 == "E";
        }(
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[6].nome_arquivo''',
            ).toString(),
            getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[6].status_documento''',
            ).toString())) {
          _model.submetidoRecompra = true;
          safeSetState(() {});
        } else {
          _model.submetidoRecompra = false;
          safeSetState(() {});
        }
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
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
                context.pushNamed(MinhasPropostasWidget.routeName);
              },
            ),
            title: Text(
              'Anexar Documentos',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: SingleChildScrollView(
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) {
                              final docsPendentes =
                                  FFAppState().documentosPendentes.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: docsPendentes.length,
                                itemBuilder: (context, docsPendentesIndex) {
                                  final docsPendentesItem =
                                      docsPendentes[docsPendentesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          functions
                                                              .displayStepNumber(
                                                                  docsPendentesIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (functions
                                                          .displayStepNumber(
                                                              docsPendentesIndex)
                                                          .toString() !=
                                                      _model.docs.length
                                                          .toString())
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.84, 0.0),
                                                      child: Container(
                                                        width: 2.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.08,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 8.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                docsPendentesItem,
                                                                r'''$..nome_documento''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          if ((String var1) {
                                                            return var1 == "S";
                                                          }(getJsonField(
                                                            docsPendentesItem,
                                                            r'''$..obrigatorio''',
                                                          ).toString()))
                                                            Text(
                                                              '*',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if ((String var1) {
                                                return var1 == "R";
                                              }(getJsonField(
                                                _model.docs
                                                    .where((e) =>
                                                        getJsonField(
                                                          e,
                                                          r'''$..codigo_documento''',
                                                        ) ==
                                                        getJsonField(
                                                          docsPendentesItem,
                                                          r'''$..codigo_documento''',
                                                        ))
                                                    .toList()
                                                    .firstOrNull,
                                                r'''$..status_documento''',
                                              ).toString()))
                                                Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 24.0,
                                                ),
                                              if ((String var1, String var2) {
                                                return var1 == "E" &&
                                                    var2 != "null";
                                              }(
                                                  getJsonField(
                                                    _model.docs
                                                        .where((e) =>
                                                            getJsonField(
                                                              e,
                                                              r'''$..codigo_documento''',
                                                            ) ==
                                                            getJsonField(
                                                              docsPendentesItem,
                                                              r'''$..codigo_documento''',
                                                            ))
                                                        .toList()
                                                        .firstOrNull,
                                                    r'''$..status_documento''',
                                                  ).toString(),
                                                  getJsonField(
                                                    _model.docs
                                                        .where((e) =>
                                                            getJsonField(
                                                              e,
                                                              r'''$..codigo_documento''',
                                                            ) ==
                                                            getJsonField(
                                                              docsPendentesItem,
                                                              r'''$..codigo_documento''',
                                                            ))
                                                        .toList()
                                                        .firstOrNull,
                                                    r'''$..nome_arquivo''',
                                                  ).toString()))
                                                Icon(
                                                  Icons.check,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.upload,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: ModalWidget(
                                                              codigoDocPendente:
                                                                  getJsonField(
                                                                docsPendentesItem,
                                                                r'''$..codigo_documento''',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ]
                            .addToStart(SizedBox(height: 10.0))
                            .addToEnd(SizedBox(height: 10.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: ((FFAppState().listaArquivos.isNotEmpty) ==
                                  false)
                              ? null
                              : () async {
                                  if (!functions.containsAllRequiredCodes(
                                      FFAppState().listaArquivos.toList(),
                                      FFAppState()
                                          .arquivosObrigatorios
                                          .toList())) {
                                    _model.custom =
                                        await actions.montarCorpoJson(
                                      FFAppState()
                                          .listaArquivos
                                          .map((e) => e.toMap())
                                          .toList(),
                                    );
                                    _model.enviaDocumento = await FACConsigGroup
                                        .enviaDocumentoCall
                                        .call(
                                      listaArquivosJson: FFAppState()
                                          .listaArquivos
                                          .map((e) => e.toMap())
                                          .toList(),
                                    );

                                    if ((_model.enviaDocumento?.succeeded ??
                                        true)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(getJsonField(
                                              (_model.enviaDocumento
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$..message''',
                                            ).toString()),
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
                                      _model.checkUploadArquivo2 =
                                          await FACConsigGroup
                                              .documentosPendentesCall
                                              .call(
                                        cpf: FFAppState().cpf,
                                      );

                                      if ((_model
                                              .checkUploadArquivo2?.succeeded ??
                                          true)) {
                                        _model.docs = getJsonField(
                                          (_model.checkUploadArquivo2
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.dados''',
                                          true,
                                        )!
                                            .toList()
                                            .cast<dynamic>();
                                        safeSetState(() {});
                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[0].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[0].status_documento''',
                                            ).toString())) {
                                          _model.submetidoIdentificacao = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoIdentificacao = false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[1].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[1].status_documento''',
                                            ).toString())) {
                                          _model.submetidoComprovante = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoComprovante = false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[2].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[2].status_documento''',
                                            ).toString())) {
                                          _model.submetidoPAD = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoPAD = false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[3].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[3].status_documento''',
                                            ).toString())) {
                                          _model.submetidoAutorizacaoDesconto =
                                              true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoAutorizacaoDesconto =
                                              false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[4].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[4].status_documento''',
                                            ).toString())) {
                                          _model.submetidoContaBancaria = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoContaBancaria = false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[5].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[5].status_documento''',
                                            ).toString())) {
                                          _model.submetidoContraCheque = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoContraCheque = false;
                                          safeSetState(() {});
                                        }

                                        if ((String var1, String var2) {
                                          return var1 != "null" ||
                                              var2 == "E";
                                        }(
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[6].nome_arquivo''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.checkUploadArquivo2
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.dados[6].status_documento''',
                                            ).toString())) {
                                          _model.submetidoRecompra = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.submetidoRecompra = false;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      }
                                    } else {
                                      _model.teste = await actions.teste(
                                        _model.custom!,
                                      );
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(getJsonField(
                                              (_model.enviaDocumento
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$..message''',
                                            ).toString()),
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
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Atenção!'),
                                          content: Text(
                                              'Favor anexar todos os documentos obrigatórios!'),
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
                          text: 'Enviar documentos',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 45.0,
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
                            disabledColor: Color(0x4D33B46E),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().listaArquivos = [];
                            safeSetState(() {});

                            context.pushNamed(MinhasPropostasWidget.routeName);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
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
                      ],
                    ),
                  ]
                      .divide(SizedBox(height: 30.0))
                      .addToStart(SizedBox(height: 20.0))
                      .addToEnd(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
