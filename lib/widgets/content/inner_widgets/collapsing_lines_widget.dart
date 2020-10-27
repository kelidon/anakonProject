import 'dart:ui';

import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollapsingLinesWidget extends StatefulWidget {
  final CollapsingTitle titleType;

  const CollapsingLinesWidget({Key key, this.titleType}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollapsingWidgetState(this.titleType);
}

class _CollapsingWidgetState extends State<CollapsingLinesWidget>
    with SingleTickerProviderStateMixin {
  final CollapsingTitle titleType;

  AnimationController expandController;
  Animation<double> animation;

  _CollapsingWidgetState(this.titleType);

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    expandController.forward();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isConsBloc = CollapsingTypeToStateMapper.consTypes.contains(titleType);
    return InkWell(
        onTap: () {
          if (isConsBloc) {
            var isCurrent =
                context.bloc<CollapsedHeadersConsBloc>().state.key == titleType;
            if (context.bloc<CollapsedHeadersConsBloc>().state.value ==
                CollapsingState.COLLAPSED) {
              if (isCurrent) {
                context
                    .bloc<CollapsedHeadersConsBloc>()
                    .add(ExpandEvent(titleType));
              } else {
                context
                    .bloc<CollapsedHeadersConsBloc>()
                    .add(CollapseEvent(titleType));
              }
            } else {
              context
                  .bloc<CollapsedHeadersConsBloc>()
                  .add(CollapseEvent(titleType));
            }
          } else {
            var isCurrent =
                context.bloc<CollapsedHeadersHowWorkBloc>().state.key ==
                    titleType;
            if (context.bloc<CollapsedHeadersHowWorkBloc>().state.value ==
                CollapsingState.COLLAPSED) {
              if (isCurrent) {
                context
                    .bloc<CollapsedHeadersHowWorkBloc>()
                    .add(ExpandEvent(titleType));
              } else {
                context
                    .bloc<CollapsedHeadersHowWorkBloc>()
                    .add(CollapseEvent(titleType));
              }
            } else {
              context
                  .bloc<CollapsedHeadersHowWorkBloc>()
                  .add(CollapseEvent(titleType));
            }
          }
        },
        child: isConsBloc
            ? BlocBuilder<CollapsedHeadersConsBloc,
                MapEntry<CollapsingTitle, CollapsingState>>(
                builder: (_, state) {
                  bool isCollapsed = state.value == CollapsingState.COLLAPSED;
                  bool isCurrent = state.key != null && state.key == titleType;
                  if (!isCollapsed) {
                    expandController.forward();
                  } else {
                    expandController.reverse();
                  }
                  return Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: isCurrent && isCollapsed
                                  ? AppColors.PRIMARY
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 3)),
                              ]),
                          child: Center(
                              child: Icon(
                            CollapsingTypeToStateMapper
                                .typeToStateMap[titleType].key,
                            color: isCurrent && isCollapsed
                                ? Colors.white
                                : AppColors.PRIMARY,
                          )),
                        ),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     boxShadow: [
                        //       BoxShadow(
                        //           color: Colors.grey.withOpacity(0.5),
                        //           blurRadius: 4,
                        //           offset: Offset(1, 3)),
                        //     ]),
                        SizeTransition(
                            axis: Axis.horizontal,
                            axisAlignment: 1,
                            sizeFactor: animation,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(CollapsingTypeToStateMapper
                                      .typeToStateMap[titleType].value.key),
                            )),
                      ],
                    ),
                  );
                },
              )
            : BlocBuilder<CollapsedHeadersHowWorkBloc,
                MapEntry<CollapsingTitle, CollapsingState>>(
                builder: (_, state) {
                  bool isCollapsed = state.value == CollapsingState.COLLAPSED;
                  bool isCurrent = state.key != null && state.key == titleType;
                  if (!isCollapsed) {
                    expandController.forward();
                  } else {
                    expandController.reverse();
                  }
                  return Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: isCurrent && isCollapsed
                                  ? Colors.blue
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 3)),
                              ]),
                          child: Center(
                              child: Icon(
                            CollapsingTypeToStateMapper
                                .typeToStateMap[titleType].key,
                            color: isCurrent && isCollapsed
                                ? Colors.white
                                : Colors.blue,
                          )),
                        ),
                        Container(
                          color: Colors.red,
                          child: SizeTransition(
                              axis: Axis.horizontal,
                              axisAlignment: 1,
                              sizeFactor: animation,
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(CollapsingTypeToStateMapper
                                        .typeToStateMap[titleType].value.key),
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}
