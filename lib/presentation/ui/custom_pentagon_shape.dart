import 'package:flutter/material.dart';

Widget customPentagon({required Color color, required Widget childWidget}) =>
    CustomPaint(painter: RPSCustomPainter(color: color), child: childWidget);

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final Color color;
  const RPSCustomPainter({this.color = Colors.white});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4712644, size.height * 0.009529040);
    path_0.cubicTo(
        size.width * 0.4890460,
        size.height * 0.0005071717,
        size.width * 0.5109540,
        size.height * 0.0005071869,
        size.width * 0.5287356,
        size.height * 0.009529040);
    path_0.lineTo(size.width * 0.9689828, size.height * 0.2328955);
    path_0.cubicTo(
        size.width * 0.9867644,
        size.height * 0.2419172,
        size.width * 0.9977184,
        size.height * 0.2585899,
        size.width * 0.9977184,
        size.height * 0.2766338);
    path_0.lineTo(size.width * 0.9977184, size.height * 0.7233687);
    path_0.cubicTo(
        size.width * 0.9977184,
        size.height * 0.7414091,
        size.width * 0.9867644,
        size.height * 0.7580808,
        size.width * 0.9689828,
        size.height * 0.7671061);
    path_0.lineTo(size.width * 0.5287356, size.height * 0.9904697);
    path_0.cubicTo(
        size.width * 0.5109540,
        size.height * 0.9994949,
        size.width * 0.4890460,
        size.height * 0.9994949,
        size.width * 0.4712644,
        size.height * 0.9904697);
    path_0.lineTo(size.width * 0.03101989, size.height * 0.7671061);
    path_0.cubicTo(
        size.width * 0.01323822,
        size.height * 0.7580808,
        size.width * 0.002284259,
        size.height * 0.7414091,
        size.width * 0.002284259,
        size.height * 0.7233636);
    path_0.lineTo(size.width * 0.002284259, size.height * 0.2766338);
    path_0.cubicTo(
        size.width * 0.002284259,
        size.height * 0.2585899,
        size.width * 0.01323822,
        size.height * 0.2419172,
        size.width * 0.03101989,
        size.height * 0.2328949);
    path_0.lineTo(size.width * 0.4712644, size.height * 0.009529040);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
