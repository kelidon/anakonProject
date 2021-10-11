import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';

class SpinStraightHorizontalWidget extends StatefulWidget {
  @override
  _SpinStraightHorizontalWidgetState createState() =>
      _SpinStraightHorizontalWidgetState();
}

class _SpinStraightHorizontalWidgetState
    extends State<SpinStraightHorizontalWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _straightController;
  Animation<double> innerLinesAnimation;
  Animation<double> outerLinesAnimation;
  Animation<double> curvedLinesAnimation;

  @override
  void initState() {
    super.initState();
    _straightController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    innerLinesAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(_straightController);
    outerLinesAnimation =
        CurveTween(curve: Curves.easeInSine).animate(_straightController);
    curvedLinesAnimation =
        Tween<double>(begin: 0, end: 300).animate(_straightController);

    _straightController.addListener(() {
      setState(() {});
    });
    _straightController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _straightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildStraightLine(double yAlignment) {
      return Align(
        alignment: Alignment(-1, yAlignment),
        child: Container(
          color: AppColors.PRIMARY,
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          _buildStraightLine(outerLinesAnimation.value / 2 - 1),
          _buildStraightLine(-innerLinesAnimation.value),
          _buildStraightLine(innerLinesAnimation.value),
          _buildStraightLine(1 - outerLinesAnimation.value / 2),
        ],
      ),
    );
  }
}
