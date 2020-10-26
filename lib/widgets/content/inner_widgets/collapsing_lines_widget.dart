import 'dart:ui';

import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollapsingLinesWidget extends StatefulWidget {
  final CollapsingTitle titleType;

  const CollapsingLinesWidget({Key key, this.titleType}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CollapsingWidgetState(this.titleType);
}

class _CollapsingWidgetState extends State<CollapsingLinesWidget> {
  final CollapsingTitle titleType;

  _CollapsingWidgetState(this.titleType);
  @override
  Widget build(BuildContext context) {

    _buildCollapsingWidget(MapEntry<CollapsingTitle, CollapsingState> state) {
      bool isCollapsed = !(state.value == CollapsingState.EXPANDED);
      bool isCurrent = state.key == titleType;
      return isCollapsed
          ? Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 50,
              height: 50,
              color: isCurrent ? Colors.blue : Colors.green,
              child: Center(
                  child: Icon(
                CollapsingTypeToStateMapper.typeToStateMap[titleType].key,
                color: isCurrent ? Colors.white : Colors.blue,
              )),
            )
          : Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.maxFinite,
              height: 50,
              color: Colors.red,
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(CollapsingTypeToStateMapper
                              .typeToStateMap[titleType].key))),
                  SizedBox(
                    width: 10,
                  ),
                  Text(CollapsingTypeToStateMapper
                      .typeToStateMap[titleType].value.key),
                ],
              ),
            );
    }

    bool isConsBloc = CollapsingTypeToStateMapper.consTypes.contains(titleType);
    return InkWell(
        onTap: () {
          if (isConsBloc) {
            if (context.bloc<CollapsedHeadersConsBloc>().state.key ==
                titleType) {
              if (context.bloc<CollapsedHeadersConsBloc>().state.value ==
                  CollapsingState.COLLAPSED)
                context
                    .bloc<CollapsedHeadersConsBloc>()
                    .add(ExpandEvent(titleType));
              else {
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
            if (context.bloc<CollapsedHeadersHowWorkBloc>().state.key ==
                titleType) {
              if (context.bloc<CollapsedHeadersHowWorkBloc>().state.value ==
                  CollapsingState.COLLAPSED)
                context
                    .bloc<CollapsedHeadersHowWorkBloc>()
                    .add(ExpandEvent(titleType));
              else {
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
                  return _buildCollapsingWidget(state);
                },
              )
            : BlocBuilder<CollapsedHeadersHowWorkBloc,
                MapEntry<CollapsingTitle, CollapsingState>>(
                builder: (_, state) {
                  return _buildCollapsingWidget(state);
                },
              ));
  }
}
