import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> loadCustomMarkerIcon(IconData iconData, Color color, int fontSize) async {
  final pictureRecorder = PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final textPainter = TextPainter(textDirection: TextDirection.ltr);
  final iconStr = String.fromCharCode(iconData.codePoint);

  textPainter.text = TextSpan(
    text: iconStr,
    style: TextStyle(
      letterSpacing: 0.0,
      fontSize: fontSize.toDouble(),
      fontFamily: iconData.fontFamily,
      color: color,
    ),
  );
  textPainter.layout();
  textPainter.paint(canvas, const Offset(0.0, 0.0));

  final picture = pictureRecorder.endRecording();
  final image = await picture.toImage(fontSize, fontSize);
  final bytes = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
}
