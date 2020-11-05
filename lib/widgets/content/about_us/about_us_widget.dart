import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/hero_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsWidget extends StatefulWidget {
  final double height;

  const AboutUsWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutUsWidgetState(height);
}

var aboutNavigatorKey = GlobalKey<NavigatorState>();

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final double height;

  _AboutUsWidgetState(this.height);

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
              AppText.TAGLINE_1,
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
                    AppText.ABOUT_US_TITLE,
                    style: AppStyles.TITLE,
                  ),
                ),
                Expanded(
                    child: Navigator(
                  observers: [_heroController],
                  key: aboutNavigatorKey,
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                        builder: (_) => Container(
                            alignment: Alignment.center,
                            child: HeroTableWidget(
                                navKey: aboutNavigatorKey,
                                mainContext: _,
                                bloc: context
                                    .bloc<AnimatedPicturesFirstBloc>(), title: AppText.ABOUT_US_TITLE,)));
                  },
                )),
              ],
            )),
      ],
    );
  }
}
