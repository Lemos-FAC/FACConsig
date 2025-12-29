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
  late Future<List<CameraDescription>> _cameras;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _cameras = availableCameras();
  }

  @override
  void didUpdateWidget(covariant CameraVideo oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Toggle recording based on the App State variable you created
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
      await controller!.startVideoRecording();
      setState(() => isRecording = true);
    }
  }

  Future<void> _stopVideo() async {
    if (controller != null && controller!.value.isRecordingVideo) {
      // 1. Capture the XFile from the camera
      XFile videoFile = await controller!.stopVideoRecording();
      setState(() => isRecording = false);

      // 2. Read the file as bytes (This is the "actual file" data)
      Uint8List videoBytes = await videoFile.readAsBytes();

      // 3. Create the FFUploadedFile object
      FFUploadedFile ffFile = FFUploadedFile(
        name: videoFile.name,
        bytes: videoBytes,
      );

      // 4. Return the FFUploadedFile object to FlutterFlow
      await widget.onVideoCaptured(ffFile);
    }
  }

  Future<void> _initializeCamera(List<CameraDescription> cameras) async {
    CameraDescription? selectedCamera;
    var direction = (widget.front == true)
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    try {
      selectedCamera =
          cameras.firstWhere((camera) => camera.lensDirection == direction);
    } catch (e) {
      selectedCamera = cameras.first;
    }

    await controller?.dispose();
    controller = CameraController(selectedCamera, ResolutionPreset.high,
        enableAudio: true);

    await controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: _cameras,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (controller == null) _initializeCamera(snapshot.data!);
          return controller != null && controller!.value.isInitialized
              ? Container(
                  width: widget.width,
                  height: widget.height,
                  child: CameraPreview(controller!))
              : Center(child: CircularProgressIndicator());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
