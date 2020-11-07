import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../hero_table.dart';

class HowWorkWidget extends StatefulWidget {
  final double height;

  const HowWorkWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HowWorkWidgetState(height);
}

var howWorkNavigatorKey = GlobalKey<NavigatorState>();

class _HowWorkWidgetState extends State<HowWorkWidget> {
  final double height;

  _HowWorkWidgetState(this.height);

  HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
  }

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppText.TAGLINE_3,
              style: AppStyles.TITLE,
              maxLines: 1,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 10,
                    offset: Offset(1, 3)),
              ], // boxShadow
            ),
            height: height,
            child: Column(
              children: [
                Center(
                  child: Text(
                    AppText.HOW_WORK_TITLE,
                    style: AppStyles.TITLE,
                  ),
                ),
                Expanded(
                    child: Navigator(
                  observers: [_heroController],
                  key: howWorkNavigatorKey,
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                        builder: (_) => Container(
                            alignment: Alignment.center,
                            child: HeroTableWidget(
                              mainContext: _,
                              title: AppText.HOW_WORK_TITLE,
                            )));
                  },
                )),
              ],
            )),
      ],
    );
  }
}
