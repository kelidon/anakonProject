import 'package:anakonProject/widgets/tower_widget/vertical/spin_curved_vertical_widget.dart';
import 'package:anakonProject/widgets/tower_widget/vertical/spin_straight_vertical_widget.dart';
import 'package:flutter/material.dart';

class VerticalTowerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SpinCurvedVerticalWidget(
          deviceHeight: MediaQuery.of(context).size.height,
        ),
        SpinStraightVerticalWidget()
      ],
    );
  }
}
