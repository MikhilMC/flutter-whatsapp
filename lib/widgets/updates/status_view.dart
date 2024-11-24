import 'dart:math';
import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  final int numberOfStatus;
  final int indexOfSeenStatus;
  final double spacing;
  final double radius;
  final double padding;
  final String centerImageUrl;
  final double strokeWidth;
  final Color seenColor;
  final Color unSeenColor;

  const StatusView({
    super.key,
    this.numberOfStatus = 10,
    this.indexOfSeenStatus = 0,
    this.spacing = 10.0,
    this.radius = 50.0,
    this.padding = 5.0,
    required this.centerImageUrl,
    this.strokeWidth = 4.0,
    this.seenColor = Colors.grey,
    this.unSeenColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CustomPaint(
            painter: Arc(
              alreadyWatched: indexOfSeenStatus,
              numberOfArcs: numberOfStatus,
              spacing: spacing,
              strokeWidth: strokeWidth,
              seenColor: seenColor,
              unSeenColor: unSeenColor,
            ),
          ),
        ),
        CircleAvatar(
          radius: radius - padding,
          backgroundImage: NetworkImage(centerImageUrl),
        ),
      ],
    );
  }
}

class Arc extends CustomPainter {
  final int numberOfArcs;
  final int alreadyWatched;
  final double spacing;
  final double strokeWidth;
  final Color seenColor;
  final Color unSeenColor;

  Arc({
    required this.numberOfArcs,
    required this.alreadyWatched,
    required this.spacing,
    required this.strokeWidth,
    required this.seenColor,
    required this.unSeenColor,
  });

  double _degreesToRadians(double degrees) => degrees * pi / 180.0;

  void _drawArcs({
    required Canvas canvas,
    required Offset center,
    required double radius,
    required double arcAngle,
    required Paint seenPaint,
    required Paint unSeenPaint,
    required double startAngle,
  }) {
    for (var i = 0; i < numberOfArcs; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        _degreesToRadians(startAngle + (arcAngle + spacing) * i),
        _degreesToRadians(arcAngle),
        false,
        alreadyWatched > i ? seenPaint : unSeenPaint,
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width / 2.0;
    final arcAngle =
        numberOfArcs == 1 ? 360.0 : (360.0 / numberOfArcs - spacing);
    const startAngle = 270.0;

    final seenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = seenColor;

    final unSeenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = unSeenColor;

    _drawArcs(
      canvas: canvas,
      center: center,
      radius: radius,
      arcAngle: arcAngle,
      seenPaint: seenPaint,
      unSeenPaint: unSeenPaint,
      startAngle: startAngle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
