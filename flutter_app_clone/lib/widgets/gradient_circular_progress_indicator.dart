import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final bool stokeCapRound;
  final double value;
  final Color backgroundColor;
  final double totalAngle;
  final List<Color> colors;
  final List<double> stops;

  const GradientCircularProgressIndicator(
      {Key key,
      this.strokeWidth = 2.0,
      @required this.radius,
      @required this.colors,
      this.stokeCapRound = false,
      this.value,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.stops})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _offset = 0.0;
    if (stokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
          colors: _colors,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  _GradientCircularProgressPainter(
      {this.strokeWidth: 10.0,
      this.strokeCapRound: false,
      this.value,
      this.backgroundColor = const Color(0XFFEEEEEE),
      @required this.colors,
      this.total = 2 * pi,
      this.radius,
      this.stops});

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    // draw background arc
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    // draw foreground arc.
    // apply gradient
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
