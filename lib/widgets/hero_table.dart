import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_target.dart';

class HeroTableWidget extends StatefulWidget {
  final GlobalKey<NavigatorState> aboutNavKey;
  final BuildContext mainContext;

  const HeroTableWidget({Key key, this.aboutNavKey, this.mainContext}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HeroTableWidgetState(aboutNavKey, mainContext);

}
class _HeroTableWidgetState extends State<HeroTableWidget> {
  final GlobalKey<NavigatorState> aboutNavKey;
  final BuildContext mainContext;

  _HeroTableWidgetState(this.aboutNavKey, this.mainContext);

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
                    // aboutNavKey.currentState.push(
                    //     MaterialPageRoute(builder: (context) => HeroTargetWidget(aboutNavKey: aboutNavKey, tag: 'redcont', color: Colors.red, mainContext: mainContext,))
                    //);
                    Navigator.push(mainContext, MaterialPageRoute(builder: (context) => HeroTargetWidget(aboutNavKey: aboutNavKey, tag: 'redcont', color: Colors.red, mainContext: mainContext,)));
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
                    aboutNavKey.currentState.push(
                        MaterialPageRoute(builder: (context) => HeroTargetWidget(aboutNavKey: aboutNavKey, tag: 'ycont', color: Colors.yellow, mainContext: mainContext))
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
                      aboutNavKey.currentState.push(
                          MaterialPageRoute(builder: (context) => HeroTargetWidget(aboutNavKey: aboutNavKey, tag: 'bcont', color: Colors.blue, mainContext: mainContext))
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
                      aboutNavKey.currentState.push(
                          MaterialPageRoute(builder: (context) => HeroTargetWidget(aboutNavKey: aboutNavKey, tag: 'gcont', color: Colors.green, mainContext: mainContext))
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
