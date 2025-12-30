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

class CameraPhoto extends StatefulWidget {
  const CameraPhoto({
    Key? key,
    this.width,
    this.height,
    this.front,
    required this.onPhotoCaptured,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool? front;
  final Future<dynamic> Function(String? capturedPhotoBase64) onPhotoCaptured;
  @override
  _CameraPhotoState createState() => _CameraPhotoState();
}

class _CameraPhotoState extends State<CameraPhoto> {
  CameraController? controller;
  late Future<List<CameraDescription>> _cameras;
  late CameraLensDirection direction;

  @override
  void initState() {
    super.initState();
    _cameras = availableCameras();
    direction = CameraLensDirection.front;
  }

  @override
  void didUpdateWidget(covariant CameraPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1. **Camera Switch Logic**
    // Check if the 'front' property has actually changed.
    if (widget.front != oldWidget.front) {
      // If it changed, we must re-initialize the camera.
      // We fetch the cameras list and then call the initialization function.
      _cameras.then((cameras) {
        if (cameras.isNotEmpty) {
          _initializeCamera(cameras);
        }
      });
    }

    // 2. **Take Photo Logic - CRITICAL CHECK ADDED**
    if (FFAppState().makePhoto) {
      if (controller != null && controller!.value.isInitialized) {
        controller!.takePicture().then((file) async {
          Uint8List fileAsBytes = await file.readAsBytes();
          String? capturedBase64; // Declare a variable for the result

          if (fileAsBytes.isNotEmpty) {
            capturedBase64 = base64Encode(fileAsBytes);

            // C. Update App State (Keep this)
            FFAppState().update(() {
              FFAppState().fileBase64 = capturedBase64!;
              FFAppState().makePhoto = false;
            });

            // [START] CRITICAL FIX: Signal completion to the FF action flow
            // Pass the Base64 string back to the FlutterFlow action flow
            await widget.onPhotoCaptured(capturedBase64);
            // [END] CRITICAL FIX
          } else {
            print('Error: Captured photo data is empty.');
            FFAppState().update(() {
              FFAppState().makePhoto = false;
            });
            // [START] CRITICAL FIX: Still signal completion (with null/empty data)
            await widget.onPhotoCaptured(null);
            // [END] CRITICAL FIX
          }
        }).catchError((error) async {
          // Make catchError async to await the call
          print('Error taking picture: $error');
          FFAppState().update(() {
            FFAppState().makePhoto = false;
          });
          // [START] CRITICAL FIX: Signal failure to the FF action flow
          await widget.onPhotoCaptured(null);
          // [END] CRITICAL FIX
        });
      } else {
        print('Camera controller not initialized. Resetting makePhoto flag.');
        FFAppState().update(() {
          FFAppState().makePhoto = false;
        });
        // [START] CRITICAL FIX: Signal failure to the FF action flow immediately
        // Use SchedulerBinding to prevent calling didUpdateWidget during state change
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          await widget.onPhotoCaptured(null);
        });
        // [END] CRITICAL FIX
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera(_cameras) async {
    // 1. Find the desired camera (front or back)
    CameraDescription? selectedCamera;

    try {
      if (widget.front == true) {
        direction = CameraLensDirection.front;
      } else {
        direction = CameraLensDirection.back;
      }

      selectedCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == direction,
      );
    } catch (e) {
      // Fallback to the first camera if the desired one isn't found
      selectedCamera = _cameras.first;
    }

    if (selectedCamera != null) {
      // Dispose of any existing controller before creating a new one
      await controller?.dispose();

      // 2. Initialize the controller with the selected camera
      controller = CameraController(
        selectedCamera,
        ResolutionPreset.low,
        enableAudio: false, // Generally recommended for photo widgets
      );

      await controller!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: _cameras,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // **CHANGE:** Only initialize the FIRST time if controller is null.
            if (controller == null) {
              _initializeCamera(snapshot.data!);
              // Note: Camera switching is now handled by didUpdateWidget
            }

            // Show the preview once initialized
            return controller != null && controller!.value.isInitialized
                ? MaterialApp(
                    home: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: CameraPreview(controller!),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('No cameras available.'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
