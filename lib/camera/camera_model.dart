import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'camera_widget.dart' show CameraWidget;
import 'package:flutter/material.dart';

class CameraModel extends FlutterFlowModel<CameraWidget> {
  ///  Local state fields for this page.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  bool? isFront;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Row widget.
  ScrollController? rowController;

  @override
  void initState(BuildContext context) {
    rowController = ScrollController();
  }

  @override
  void dispose() {
    rowController?.dispose();
  }
}
