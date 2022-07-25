import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const RadialProgress({
    required this.height,
    required this.width,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "1234",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple[900],
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple[900],
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  final double progress;

  RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    //canvas.drawCircle(center, size.width / 2, paint);

    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(0), math.radians(relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(RadialPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(RadialPainter oldDelegate) => false;
}
