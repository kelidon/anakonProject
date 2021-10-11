import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';

class SpinCurvedHorizontalWidget extends StatefulWidget {
  final double deviceWidth;

  const SpinCurvedHorizontalWidget({Key key, this.deviceWidth})
      : super(key: key);

  @override
  _SpinCurvedHorizontalWidgetState createState() =>
      _SpinCurvedHorizontalWidgetState();
}

class _SpinCurvedHorizontalWidgetState extends State<SpinCurvedHorizontalWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _curvedController;
  Animation<double> curvedLinesAnimation;
  double partLength = 150.0;

  @override
  void initState() {
    super.initState();
    _curvedController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    curvedLinesAnimation = Tween<double>(begin: 0, end: -partLength / 4)
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
    Widget _buildCurvedLine(double xOffset) {
      return CustomPaint(
        painter: SkeletonCurve(
            xOffset: -xOffset - partLength,
            deviceWidth: MediaQuery.of(context).size.width,
            partLength: partLength),
        child: Container(),
        willChange: true,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          _buildCurvedLine(curvedLinesAnimation.value),
          _buildCurvedLine(curvedLinesAnimation.value + partLength / 4),
          _buildCurvedLine(curvedLinesAnimation.value + partLength / 2),
          _buildCurvedLine(curvedLinesAnimation.value + partLength * 3 / 4),
          _buildCurvedLine(curvedLinesAnimation.value + partLength),
          _buildCurvedLine(curvedLinesAnimation.value + partLength * 5 / 4),
          _buildCurvedLine(curvedLinesAnimation.value + partLength * 6 / 4),
          _buildCurvedLine(curvedLinesAnimation.value + partLength * 7 / 4),
        ],
      ),
    );
  }
}

class SkeletonCurve extends CustomPainter {
  final double xOffset;
  final double deviceWidth;
  final double partLength;

  SkeletonCurve({this.xOffset, this.deviceWidth, this.partLength});

  @override
  void paint(Canvas canvas, Size size) {
    int div = 80;
    int xDiff = 20;
    int yDiff = 1;

    var path = Path();
    var paint = Paint()
      ..color = AppColors.PRIMARY
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    void toRight() {
      path.relativeCubicTo(
          xDiff * partLength / div,
          yDiff * size.height / div,
          (div - xDiff) * partLength / div,
          (div - yDiff) * size.height / div,
          partLength,
          size.height);
    }

    void toLeft() {
      path.relativeCubicTo(
          xDiff * partLength / div,
          -yDiff * size.height / div,
          (div - xDiff) * partLength / div,
          -(div - yDiff) * size.height / div,
          partLength,
          -size.height);
    }

    path.moveTo(xOffset, 0);
    for (int i = 0; i <= deviceWidth / partLength; i++) {
      toRight();
      toLeft();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
