import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_target.dart';

class HeroTableItem extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedTitle tag;

  const HeroTableItem({Key key, this.navKey, this.mainContext, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(mainContext, MaterialPageRoute(builder: (context) => HeroTargetWidget(navKey: navKey, tag: tag, color: Colors.red, mainContext: mainContext,)));
      },
      child: Hero(
        tag: tag,
        child: Container(
          width: 100,
          height: 200,
          color: Colors.red,
        ),
      ),
    );
  }

}
