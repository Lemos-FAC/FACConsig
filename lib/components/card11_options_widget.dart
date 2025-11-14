import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card11_options_model.dart';
export 'card11_options_model.dart';

class Card11OptionsWidget extends StatefulWidget {
  const Card11OptionsWidget({super.key});

  @override
  State<Card11OptionsWidget> createState() => _Card11OptionsWidgetState();
}

class _Card11OptionsWidgetState extends State<Card11OptionsWidget> {
  late Card11OptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Card11OptionsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkUploadArquivo =
          await FACConsigGroup.documentosPendentesCall.call(
        cpf: FFAppState().cpf,
      );

      if ((_model.checkUploadArquivo?.succeeded ?? true)) {
        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[0].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[0].nome_arquivo''',
            ).toString()))) {
          _model.submetidoIdentificacao = true;
          safeSetState(() {});
        } else {
          _model.submetidoIdentificacao = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[1].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[1].nome_arquivo''',
            ).toString()))) {
          _model.submetidoComprovante = true;
          safeSetState(() {});
        } else {
          _model.submetidoComprovante = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[2].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[2].nome_arquivo''',
            ).toString()))) {
          _model.submetidoPAD = true;
          safeSetState(() {});
        } else {
          _model.submetidoPAD = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[3].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[3].nome_arquivo''',
            ).toString()))) {
          _model.submetidoAutorizacaoDesconto = true;
          safeSetState(() {});
        } else {
          _model.submetidoAutorizacaoDesconto = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[4].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[4].nome_arquivo''',
            ).toString()))) {
          _model.submetidoContaBancaria = true;
          safeSetState(() {});
        } else {
          _model.submetidoContaBancaria = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[5].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[5].nome_arquivo''',
            ).toString()))) {
          _model.submetidoContraCheque = true;
          safeSetState(() {});
        } else {
          _model.submetidoContraCheque = false;
          safeSetState(() {});
        }

        if ((getJsonField(
                  (_model.checkUploadArquivo?.jsonBody ?? ''),
                  r'''$.dados[6].nome_arquivo''',
                ) !=
                null) &&
            ((String var1) {
              return var1 != "";
            }(getJsonField(
              (_model.checkUploadArquivo?.jsonBody ?? ''),
              r'''$.dados[6].nome_arquivo''',
            ).toString()))) {
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Documentos',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xC433B46E),
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Identificação (RG ou CNH)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file0 != null && _model.file0 != '') ||
                          (_model.submetidoIdentificacao == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[0].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_identificacao = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_identificacao = false;
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

                            _model.file0 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_identificacao,
                            );
                            if (_model.file0 != null && _model.file0 != '') {
                              _model.doc0 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
                                arquivo: _model.file0,
                                codigoArquivo: getJsonField(
                                  FFAppState().documentosPendentes.firstOrNull,
                                  r'''$..codigo_documento''',
                                ),
                                nomeArquivo: _model
                                    .uploadedLocalFile_identificacao
                                    .originalFilename,
                                extensaoArquivo: 'png',
                              );

                              if ((_model.doc0?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(getJsonField(
                                        (_model.doc0?.jsonBody ?? ''),
                                        r'''$..message''',
                                      ).toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedIdentificacao = true;
                                safeSetState(() {});
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(getJsonField(
                                        (_model.doc0?.jsonBody ?? ''),
                                        r'''$..message''',
                                      ).toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comprovante Residência',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file1 != null && _model.file1 != '') ||
                          (_model.submetidoComprovante == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[1].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_comprovanteResidencia =
                                      true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
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

                            _model.file1 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_comprovanteResidencia,
                            );
                            if (_model.file1 != null && _model.file1 != '') {
                              _model.doc1 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc1?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedComprovante = true;
                                safeSetState(() {});
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PAD',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file2 != null && _model.file2 != '') ||
                          (_model.submetidoPAD == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[2].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadDataPhi = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadDataPhi = false;
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

                            _model.file2 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_uploadDataPhi,
                            );
                            if (_model.file2 != null && _model.file2 != '') {
                              _model.doc2 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc2?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Autorização de Desconto',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file03 != null && _model.file03 != '') ||
                          (_model.submetidoAutorizacaoDesconto == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[3].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadDataFf8 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadDataFf8 = false;
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

                            _model.file03 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_uploadDataFf8,
                            );
                            if (_model.file03 != null && _model.file03 != '') {
                              _model.doc03 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc03?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedAutorizacaoDesconto = true;
                                safeSetState(() {});
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comprovante Conta Bancária',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file04 != null && _model.file04 != '') ||
                          (_model.submetidoContaBancaria == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[4].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadData64k = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadData64k = false;
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

                            _model.file04 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_uploadData64k,
                            );
                            if (_model.file04 != null && _model.file04 != '') {
                              _model.doc04 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc04?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedComprovanteBanco = true;
                                safeSetState(() {});
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contra Cheque',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file05 != null && _model.file05 != '') ||
                          (_model.submetidoContraCheque == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[5].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadData4yz = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadData4yz = false;
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

                            _model.file05 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_uploadData4yz,
                            );
                            if (_model.file05 != null && _model.file05 != '') {
                              _model.doc05 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc05?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedContraCheque = true;
                                safeSetState(() {});
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xFFE6E6E6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detalhamento Recompra',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.file06 != null && _model.file06 != '') ||
                          (_model.submetidoRecompra == true) ||
                          ((String var1) {
                            return var1 != "R";
                          }(getJsonField(
                            (_model.checkUploadArquivo?.jsonBody ?? ''),
                            r'''$.dados[6].status_documento''',
                          ).toString())))
                        Icon(
                          Icons.check,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 8.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.upload_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: false,
                            );
                            if (selectedFiles != null) {
                              safeSetState(() =>
                                  _model.isDataUploading_uploadDataGf5 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          originalFilename: m.originalFilename,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading_uploadDataGf5 = false;
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

                            _model.file06 = await actions.uploadedFileToBase64(
                              _model.uploadedLocalFile_uploadDataGf5,
                            );
                            if (_model.file06 != null && _model.file06 != '') {
                              _model.doc06 =
                                  await FACConsigGroup.enviaDocumentoCall.call(
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

                              if ((_model.doc06?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content:
                                          Text('Arquivo enviado com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                FFAppState().uploadedRecompra = true;
                                safeSetState(() {});
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
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Fechar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
