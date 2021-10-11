import 'package:anakonProject/widgets/tower_widget/horizontal/spin_curved_horizontal_widget.dart';
import 'package:anakonProject/widgets/tower_widget/horizontal/spin_straight_horizontal_widget.dart';
import 'package:anakonProject/widgets/tower_widget/vertical/spin_straight_vertical_widget.dart';
import 'package:flutter/material.dart';

class HorizontalTowerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SpinCurvedHorizontalWidget(
          deviceWidth: MediaQuery.of(context).size.width,
        ),
        SpinStraightHorizontalWidget()
      ],
    );
  }
}
