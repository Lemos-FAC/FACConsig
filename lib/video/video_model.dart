import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'video_widget.dart' show VideoWidget;
import 'package:flutter/material.dart';

class VideoModel extends FlutterFlowModel<VideoWidget> {
  ///  Local state fields for this page.

  List<dynamic> videos = [];
  void addToVideos(dynamic item) => videos.add(item);
  void removeFromVideos(dynamic item) => videos.remove(item);
  void removeAtIndexFromVideos(int index) => videos.removeAt(index);
  void insertAtIndexInVideos(int index, dynamic item) =>
      videos.insert(index, item);
  void updateVideosAtIndex(int index, Function(dynamic) updateFn) =>
      videos[index] = updateFn(videos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (buscaVideosEducacaoFinanceira)] action in Video widget.
  ApiCallResponse? videosLista;
  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
