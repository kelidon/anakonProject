import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_target.dart';

class HeroTableItem extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;
  final AnimatedPicturesBloc bloc;

  const HeroTableItem(
      {Key key, this.navKey, this.mainContext, this.tag, this.titleTag, this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //bloc.add(ChangePictureEvent(tag));
        Navigator.push(
            mainContext,
            MaterialPageRoute(
                builder: (context) => HeroTargetWidget(
                      navKey: navKey,
                      tag: tag,
                      titleTag: titleTag,
                      color: Colors.red,
                      mainContext: mainContext,
                  bloc:bloc
                    )));
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
