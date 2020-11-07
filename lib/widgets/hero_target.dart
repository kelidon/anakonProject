import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroTargetWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;
  final Color color;

  const HeroTargetWidget(
      {Key key,
      this.navKey,
      this.tag,
      this.color,
      this.mainContext,
      this.titleTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20),
      child: Column(
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
                    Navigator.pop(mainContext);
                  },
                  child: Hero(
                    tag: tag,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height * 0.6,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(AnimatedTypeToStateMapper
                                .typeToStateMap[tag].key),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 5,
                              offset: Offset(1, 3)),
                        ], // boxShadow
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AnimatedTypeToStateMapper
                                .typeToStateMap[tag].value.key,
                            style: AppStyles.TITLE,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            AnimatedTypeToStateMapper
                                .typeToStateMap[tag].value.value,
                            style: AppStyles.REGULAR_SERVICES,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
