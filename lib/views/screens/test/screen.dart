import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: PathPainter(),
          ),
        ],
      ),
      backgroundColor: Colors.yellow,
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(50, 100, 100, 100);
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    path = Path();
    path.moveTo(100, 100);
    path.quadraticBezierTo(125, 125, 200, 100);
    canvas.drawPath(path, paint);

    paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    path = Path();
    path.moveTo(200, 100);
    path.lineTo(300, 300);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
