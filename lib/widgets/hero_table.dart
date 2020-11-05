import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_target.dart';

class HeroTableWidget extends StatefulWidget {
  final GlobalKey<NavigatorState> aboutNavKey;
  final BuildContext mainContext;
  final AnimatedPicturesBloc bloc;

  const HeroTableWidget({Key key, this.aboutNavKey, this.mainContext, this.bloc}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HeroTableWidgetState(aboutNavKey, mainContext);

}
class _HeroTableWidgetState extends State<HeroTableWidget> {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;

  _HeroTableWidgetState(this.navKey, this.mainContext);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'aboutTitle',
          child: Center(
            child: Text(AppText.ABOUT_US_TITLE, style: AppStyles.TITLE,),
          ),
        ),
        Table(
          defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width/4),
          children: [
            TableRow(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(mainContext, MaterialPageRoute(builder: (context) => HeroTargetWidget(navKey: navKey, tag: 'redcont', color: Colors.red, mainContext: mainContext,)));
                  },
                  child: Hero(
                    tag: 'redcont',
                    child: Container(
                      width: 100,
                      height: 200,
                      color: Colors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    navKey.currentState.push(
                        MaterialPageRoute(builder: (context) => HeroTargetWidget(navKey: navKey, tag: 'ycont', color: Colors.yellow, mainContext: mainContext))
                    );
                  },
                  child: Hero(
                    tag: 'ycont',
                    child: Container(
                      width: 100,
                      height: 200,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ]
            ),
            TableRow(
                children: [
                  InkWell(
                    onTap: (){
                      navKey.currentState.push(
                          MaterialPageRoute(builder: (context) => HeroTargetWidget(navKey: navKey, tag: 'bcont', color: Colors.blue, mainContext: mainContext))
                      );
                    },
                    child: Hero(
                      tag: 'bcont',
                      child: Container(
                        width: 100,
                        height: 200,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      navKey.currentState.push(
                          MaterialPageRoute(builder: (context) => HeroTargetWidget(navKey: navKey, tag: 'gcont', color: Colors.green, mainContext: mainContext))
                      );
                    },
                    child: Hero(
                      tag: 'gcont',
                      child: Container(
                        width: 100,
                        height: 200,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ]
            )
          ],
        ),
      ],
    );
  }

}
