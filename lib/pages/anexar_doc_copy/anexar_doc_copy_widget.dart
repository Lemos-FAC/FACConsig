import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/modal/modal_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'anexar_doc_copy_model.dart';
export 'anexar_doc_copy_model.dart';

class AnexarDocCopyWidget extends StatefulWidget {
  const AnexarDocCopyWidget({super.key});

  static String routeName = 'AnexarDocCopy';
  static String routePath = '/anexarDocCopy';

  @override
  State<AnexarDocCopyWidget> createState() => _AnexarDocCopyWidgetState();
}

class _AnexarDocCopyWidgetState extends State<AnexarDocCopyWidget> {
  late AnexarDocCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnexarDocCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkUploadArquivo =
          await FACConsigGroup.documentosPendentesCall.call(
        cpf: FFAppState().cpf,
      );

      if ((_model.checkUploadArquivo?.succeeded ?? true)) {
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
              context.pop();
            },
          ),
          title: Text(
            'Anexar Documentos',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
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
                  child: SingleChildScrollView(
                    primary: false,
                    controller: _model.columnController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Identificação (RG ou CNH)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[0].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[0].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_identificacao =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_identificacao =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_identificacao =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file0 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_identificacao,
                                        );
                                        if (_model.file0 != null &&
                                            _model.file0 != '') {
                                          _model.doc0 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file0,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .firstOrNull,
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_identificacao
                                                .originalFilename,
                                            extensaoArquivo: 'png',
                                          );

                                          if ((_model.doc0?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(getJsonField(
                                                      (_model.doc0?.jsonBody ??
                                                          ''),
                                                      r'''$..message''',
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState().uploadedIdentificacao =
                                                true;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(getJsonField(
                                                      (_model.doc0?.jsonBody ??
                                                          ''),
                                                      r'''$..message''',
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .firstOrNull,
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Comprovante Residência',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[1].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[1].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_comprovanteResidencia =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_comprovanteResidencia =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_comprovanteResidencia =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file1 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_comprovanteResidencia,
                                        );
                                        if (_model.file1 != null &&
                                            _model.file1 != '') {
                                          _model.doc1 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file1,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(1),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_comprovanteResidencia
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc1?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState().uploadedComprovante =
                                                true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(1),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'PAD',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[2].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[2].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataPhi =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataPhi =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataPhi =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file2 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_uploadDataPhi,
                                        );
                                        if (_model.file2 != null &&
                                            _model.file2 != '') {
                                          _model.doc2 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file2,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(2),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_uploadDataPhi
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc2?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState().uploadedPAD = true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(2),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Autorização de Desconto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[3].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[3].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataFf8 =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataFf8 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataFf8 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file03 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_uploadDataFf8,
                                        );
                                        if (_model.file03 != null &&
                                            _model.file03 != '') {
                                          _model.doc03 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file03,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(3),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_uploadDataFf8
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc03?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState()
                                                    .uploadedAutorizacaoDesconto =
                                                true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(3),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Comprovante Conta Bancária',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[4].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[4].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadData64k =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadData64k =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadData64k =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file04 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_uploadData64k,
                                        );
                                        if (_model.file04 != null &&
                                            _model.file04 != '') {
                                          _model.doc04 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file04,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(4),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_uploadData64k
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc04?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState()
                                                    .uploadedComprovanteBanco =
                                                true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(4),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Contra Cheque',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[5].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[5].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadData4yz =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadData4yz =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadData4yz =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file05 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_uploadData4yz,
                                        );
                                        if (_model.file05 != null &&
                                            _model.file05 != '') {
                                          _model.doc05 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file05,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(4),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_uploadData4yz
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc05?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState().uploadedContraCheque =
                                                true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(5),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Detalhamento Recompra',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if ((String var1) {
                                    return var1 == "R";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[6].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                  if ((String var1) {
                                    return var1 == "E";
                                  }(getJsonField(
                                    (_model.checkUploadArquivo?.jsonBody ?? ''),
                                    r'''$.dados[6].status_documento''',
                                  ).toString()))
                                    Icon(
                                      Icons.check,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 8.0,
                                      borderWidth: 2.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.upload_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          safeSetState(() => _model
                                                  .isDataUploading_uploadDataGf5 =
                                              true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading_uploadDataGf5 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_uploadDataGf5 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        _model.file06 =
                                            await actions.uploadedFileToBase64(
                                          _model
                                              .uploadedLocalFile_uploadDataGf5,
                                        );
                                        if (_model.file06 != null &&
                                            _model.file06 != '') {
                                          _model.doc06 = await FACConsigGroup
                                              .atualizaMultiplosDocumentosCodigoCall
                                              .call(
                                            arquivo: _model.file06,
                                            codigoArquivo: getJsonField(
                                              FFAppState()
                                                  .documentosPendentes
                                                  .elementAtOrNull(5),
                                              r'''$..codigo_documento''',
                                            ),
                                            nomeArquivo: _model
                                                .uploadedLocalFile_uploadDataGf5
                                                .originalFilename,
                                            extensaoArquivo: 'pdf',
                                          );

                                          if ((_model.doc06?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Arquivo enviado com sucesso!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            FFAppState().uploadedRecompra =
                                                true;
                                            safeSetState(() {});
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: ModalWidget(
                                                    codigoDocPendente:
                                                        getJsonField(
                                                      FFAppState()
                                                          .documentosPendentes
                                                          .elementAtOrNull(6),
                                                      r'''$..codigo_documento''',
                                                    ),
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
                            ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ].addToStart(SizedBox(height: 60.0)),
            ),
          ),
        ),
      ),
    );
  }
}
