import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroTargetWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;
  final Color color;
  final AnimatedPicturesBloc bloc;

  const HeroTargetWidget(
      {Key key,
      this.navKey,
      this.tag,
      this.color,
      this.mainContext,
      this.titleTag, this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: titleTag,
          child: Center(
            child: Text(
              titleTag,
              style: AppStyles.TITLE,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  //bloc.add(ChangePictureEvent(null));
                  Navigator.pop(mainContext);
                },
                child: Hero(
                  tag: tag,
                  child: Container(
                    width: 400,
                    height: 400,
                    color: color,
                    child: Image(
                      image: AssetImage(AnimatedTypeToStateMapper.typeToStateMap[tag].key),
                    )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal,
                  child: Text(AnimatedTypeToStateMapper.typeToStateMap[tag].value.value),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
