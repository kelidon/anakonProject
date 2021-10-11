import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';

class SpinStraightVerticalWidget extends StatefulWidget {
  @override
  _SpinStraightVerticalWidgetState createState() => _SpinStraightVerticalWidgetState();
}

class _SpinStraightVerticalWidgetState extends State<SpinStraightVerticalWidget>
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
    Widget _buildStraightLine(double xAlignment) {
      return Align(
        alignment: Alignment(xAlignment, -1),
        child: Container(
          color: AppColors.PRIMARY,
          width: 5,
          height: MediaQuery.of(context).size.width,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
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
