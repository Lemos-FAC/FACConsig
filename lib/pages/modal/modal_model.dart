import '/flutter_flow/flutter_flow_util.dart';
import 'modal_widget.dart' show ModalWidget;
import 'package:flutter/material.dart';

class ModalModel extends FlutterFlowModel<ModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading_uploadData2f8 = false;
  FFUploadedFile uploadedLocalFile_uploadData2f8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataCj8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataCj8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataDoy = false;
  FFUploadedFile uploadedLocalFile_uploadDataDoy =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadData4hh = false;
  FFUploadedFile uploadedLocalFile_uploadData4hh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
