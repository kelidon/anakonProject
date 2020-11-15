import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'content/services/bottom_sheet.dart';
import 'custom_page_route.dart';
import 'hero_target.dart';

class HeroTableItem extends StatelessWidget {
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;

  const HeroTableItem(
      {Key key, this.mainContext, this.tag, this.titleTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
    bool isMouse = state != Metrics.SMALL;
      return InkWell(
        onTap: () {
          if (isMouse) {
            Navigator.push(
                mainContext,
                CustomPageRoute(HeroTargetWidget(
                    tag: tag,
                    titleTag: titleTag,
                    mainContext: mainContext)));
          }
          else{
            BottomSheetWidget().showBottomSheet(
                AnimatedTypeToStateMapper
                    .typeToStateMap[tag]
                    .value.key,
                AnimatedTypeToStateMapper
                    .typeToStateMap[tag]
                    .value.value,
                "");
          }
        },
        child: BlocBuilder<MetricsBloc, Metrics>(
          builder: (_, state) {
            bool isMouse = state != Metrics.SMALL;
            return isMouse?Column(
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
                    height: MediaQuery.of(context).size.height>670?MediaQuery.of(context).size.height / 3.8:175,
                  ),
                ),
                Text(
                  AnimatedTypeToStateMapper.typeToStateMap[tag].value.key,
                  style:  state == Metrics.BIG? AppStyles.TITLE:AppStyles.TITLE_M,
                ),
              ],
            ):Container(
              height: MediaQuery.of(context).size.height/15,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 5,
                      offset: Offset(1, 3)),
                ], // boxShadow
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: tag,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(
                                AnimatedTypeToStateMapper.typeToStateMap[tag].key),
                            fit: BoxFit.cover
                        )
                      ),
                      width: 50,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AnimatedTypeToStateMapper.typeToStateMap[tag].value.key,
                        style: state == Metrics.BIG?AppStyles.TITLE:AppStyles.TITLE_M,
                      ))
                  ),
                ],
              ),
            );
          }
        ),
      );});

  }
}
