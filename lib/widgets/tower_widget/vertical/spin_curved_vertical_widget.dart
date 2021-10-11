import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';

class SpinCurvedVerticalWidget extends StatefulWidget {
  final double deviceHeight;

  const SpinCurvedVerticalWidget({Key key, this.deviceHeight})
      : super(key: key);

  @override
  _SpinCurvedVerticalWidgetState createState() =>
      _SpinCurvedVerticalWidgetState();
}

class _SpinCurvedVerticalWidgetState extends State<SpinCurvedVerticalWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _curvedController;
  Animation<double> curvedLinesAnimation;

  @override
  void initState() {
    super.initState();
    _curvedController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    curvedLinesAnimation = Tween<double>(begin: 0, end: widget.deviceHeight / 4)
        .animate(_curvedController);

    _curvedController.addListener(() {
      setState(() {});
    });
    _curvedController.repeat();
  }

  @override
  void dispose() {
    _curvedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildCurvedLine(double yOffset) {
      return CustomPaint(
        painter: SkeletonCurve(-yOffset - MediaQuery.of(context).size.height),
        child: Container(),
        willChange: true,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          _buildCurvedLine(curvedLinesAnimation.value),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height / 4),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height / 2),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height * 3 / 4),
          _buildCurvedLine(
              curvedLinesAnimation.value + MediaQuery.of(context).size.height),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height * 5 / 4),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height * 6 / 4),
          _buildCurvedLine(curvedLinesAnimation.value +
              MediaQuery.of(context).size.height * 7 / 4),
        ],
      ),
    );
  }
}

class SkeletonCurve extends CustomPainter {
  final double yOffset;

  SkeletonCurve(this.yOffset);

  @override
  void paint(Canvas canvas, Size size) {
    int div = 80;
    int xDiff = 1;
    int yDiff = 20;

    var path = Path();
    var paint = Paint()
      ..color = AppColors.PRIMARY
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    void toRight() {
      path.relativeCubicTo(
          xDiff * size.width / div,
          yDiff * size.height / div,
          (div - xDiff) * size.width / div,
          (div - yDiff) * size.height / div,
          size.width,
          size.height);
    }

    void toLeft() {
      path.relativeCubicTo(
          -xDiff * size.width / div,
          yDiff * size.height / div,
          -(div - xDiff) * size.width / div,
          (div - yDiff) * size.height / div,
          -size.width,
          size.height);
    }

    path.moveTo(0, yOffset);
    toRight();
    toLeft();
    toRight();
    toLeft();
    toRight();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
