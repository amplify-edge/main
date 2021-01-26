import 'package:flutter/material.dart';
import 'package:maintemplatev2/core/i18n/app_localization.dart';

class RootPage extends StatelessWidget {
  RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CurvePainter(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              AppLocalizations.of(context).noMenuSelected(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final BuildContext context;

  CurvePainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Theme.of(context).primaryColor;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height / 16);
    path.quadraticBezierTo(
        size.width / 16, size.height / 10, size.width / 8, size.height / 10);
    path.lineTo(size.width, size.height / 10);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
