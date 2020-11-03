import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroTargetWidget extends StatelessWidget{
  final GlobalKey<NavigatorState> aboutNavKey;
  final BuildContext mainContext;
  final tag;
  final Color color;

  const HeroTargetWidget({Key key, this.aboutNavKey, this.tag, this.color, this.mainContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'aboutTitle',
          child: Center(
            child: Text(AppText.ABOUT_US_TITLE, style: AppStyles.TITLE,),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(mainContext);
                },
                child: Hero(
                  tag: tag,
                  child: Container(
                    width: 400,
                    height: 400,
                    color: color,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

}
