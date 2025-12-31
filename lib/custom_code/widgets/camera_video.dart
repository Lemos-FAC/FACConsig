// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/scheduler.dart';

class CameraVideo extends StatefulWidget {
  const CameraVideo({
    Key? key,
    this.width,
    this.height,
    this.front,
    required this.onVideoCaptured,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool? front;
  final Future<dynamic> Function(FFUploadedFile? videoFile) onVideoCaptured;

  @override
  _CameraVideoState createState() => _CameraVideoState();
}

class _CameraVideoState extends State<CameraVideo> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  bool isRecording = false;
  bool isInitializing = false; // Proteção extra

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  Future<void> _loadCameras() async {
    cameras = await availableCameras();
    if (mounted) {
      _initializeCamera();
    }
  }

  @override
  void didUpdateWidget(covariant CameraVideo oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1. Verifica se o usuário solicitou trocar de câmera (Frente/Trás)
    if (oldWidget.front != widget.front) {
      _initializeCamera();
    }

    // 2. Verifica a mudança de estado de gravação (Timer)
    if (FFAppState().isRecording != isRecording) {
      if (FFAppState().isRecording) {
        _startVideo();
      } else {
        _stopVideo();
      }
    }
  }

  Future<void> _startVideo() async {
    if (controller != null && controller!.value.isInitialized && !isRecording) {
      try {
        await controller!.startVideoRecording();
        setState(() => isRecording = true);
      } catch (e) {
        print("Erro ao iniciar: $e");
      }
    }
  }

  Future<void> _stopVideo() async {
    if (controller != null && controller!.value.isRecordingVideo) {
      try {
        XFile videoFile = await controller!.stopVideoRecording();
        if (mounted) setState(() => isRecording = false);

        // Lendo bytes de forma segura
        final Uint8List videoBytes = await videoFile.readAsBytes();

        FFUploadedFile ffFile = FFUploadedFile(
          name: videoFile.name,
          bytes: videoBytes,
        );

        await widget.onVideoCaptured(ffFile);
      } catch (e) {
        print("Erro ao parar: $e");
      }
    }
  }

  Future<void> _initializeCamera() async {
    if (cameras == null || cameras!.isEmpty || isInitializing) return;

    setState(() => isInitializing = true);

    CameraDescription? selectedCamera;
    var direction = (widget.front == true)
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    try {
      selectedCamera =
          cameras!.firstWhere((camera) => camera.lensDirection == direction);
    } catch (e) {
      selectedCamera = cameras!.first;
    }

    await controller?.dispose();
    controller = CameraController(
      selectedCamera,
      ResolutionPreset.low, // Mantido low para evitar crash de memória
      enableAudio: true,
    );

    try {
      await controller!.initialize();
    } catch (e) {
      print("Erro inicialização: $e");
    }

    if (mounted) {
      setState(() => isInitializing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Interface simplificada sem FutureBuilder dentro do build para evitar loops
    if (controller == null || !controller!.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(
          color: FlutterFlowTheme.of(context).primary,
        ),
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: CameraPreview(controller!),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
