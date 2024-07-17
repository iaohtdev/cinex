import 'package:cinex/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = AppColor.primaryColor;
    paint.strokeWidth = 5;

    final double xOffset = 10;
    final double startX = offset.dx - xOffset;
    final double endX = offset.dx + configuration.size!.width + xOffset;
    final double y = offset.dy + paint.strokeWidth / 2;

    canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
  }
}
