import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_page_route.dart';
import 'hero_target.dart';

class HeroTableItem extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;

  const HeroTableItem(
      {Key key, this.navKey, this.mainContext, this.tag, this.titleTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            mainContext,
            CustomPageRoute(HeroTargetWidget(
                navKey: navKey,
                tag: tag,
                titleTag: titleTag,
                color: Colors.red,
                mainContext: mainContext)));
      },
      child: Column(
        children: [
          Hero(
            tag: tag,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(
                        AnimatedTypeToStateMapper.typeToStateMap[tag].key),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 5,
                      offset: Offset(1, 3)),
                ], // boxShadow
              ),
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 3.5,
            ),
          ),
          Text(
            AnimatedTypeToStateMapper.typeToStateMap[tag].value.key,
            style: AppStyles.TITLE,
          ),
        ],
      ),
    );
  }
}
