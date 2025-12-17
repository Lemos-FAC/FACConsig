import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'image_model.dart';
export 'image_model.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    required this.bgImage,
  });

  final FFUploadedFile? bgImage;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late ImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.memory(
        widget.bgImage?.bytes ?? Uint8List.fromList([]),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
