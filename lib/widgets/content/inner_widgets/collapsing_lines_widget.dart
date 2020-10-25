import 'dart:ui';

import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/type_to_state_mapper.dart';
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
    return InkWell(onTap: () {
      if (context.bloc<CollapsedHeadersBloc>().state.key == titleType) {
        if (context.bloc<CollapsedHeadersBloc>().state.value ==
            CollapsingState.COLLAPSED)
          context.bloc<CollapsedHeadersBloc>().add(ExpandEvent(titleType));
        else {
          context.bloc<CollapsedHeadersBloc>().add(CollapseEvent(titleType));
        }
      } else {
        context.bloc<CollapsedHeadersBloc>().add(CollapseEvent(titleType));
      }
    }, child: BlocBuilder<CollapsedHeadersBloc,
        MapEntry<CollapsingTitle, CollapsingState>>(
      builder: (_, state) {
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
                  TypeToStateMapper.typeToStateMap[titleType].key,
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
                            child: Icon(TypeToStateMapper
                                .typeToStateMap[titleType].key))),
                    SizedBox(
                      width: 10,
                    ),
                    Text(TypeToStateMapper.typeToStateMap[titleType].value.key),
                  ],
                ),
              );
      },
    ));
  }
}
