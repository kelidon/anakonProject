import 'dart:ui';

import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/constants/styles.dart';
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

  _CollapsingWidgetState(this.titleType);

  Widget lineWidget;

  @override
  void initState() {
    super.initState();
    lineWidget = _buildExpandedLine();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isConsTextVisible = true;
  bool isHowWorkVisible = true;

  _buildLineIcon(MapEntry<CollapsingTitle, CollapsingState> state) {
    bool isCollapsed = state.value == CollapsingState.COLLAPSED;
    bool isCurrent = state.key != null && state.key == titleType;
    var isCurrentCollapsed = isCurrent && isCollapsed;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 65,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: isCurrentCollapsed ? AppColors.PRIMARY : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4,
                offset: Offset(1, 3)),
          ]),
      child: Center(
          child: Icon(
        CollapsingTypeToStateMapper.typeToStateMap[titleType].key,
        color: isCurrentCollapsed ? Colors.white : AppColors.PRIMARY,
        size: 35,
      )),
    );
  }

  _buildExpandedLine() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        CollapsingTypeToStateMapper.typeToStateMap[titleType].value.key,
        style: AppStyles.TITLE,
      ),
    );
  }

  _buildCollapsingLine(MapEntry<CollapsingTitle, CollapsingState> state) {
    if (state.value == CollapsingState.COLLAPSED) {
      lineWidget = Container();
    } else {
      lineWidget = _buildExpandedLine();
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 2000),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: child,
        axis: Axis.horizontal,
      ),
      child: lineWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isConsBloc = CollapsingTypeToStateMapper.consTypes.contains(titleType);
    return InkWell(
        onTap: () {
          var bloc = isConsBloc
              ? context.bloc<CollapsedHeadersConsBloc>()
              : context.bloc<CollapsedHeadersHowWorkBloc>();
          var isCurrent = bloc.state.key == titleType;
          if (bloc.state.value == CollapsingState.COLLAPSED) {
            if (isCurrent) {
              bloc.add(ExpandEvent(titleType));
            } else {
              bloc.add(CollapseEvent(titleType));
            }
          } else {
            bloc.add(CollapseEvent(titleType));
          }
        },
        child: isConsBloc
            ? BlocBuilder<CollapsedHeadersConsBloc,
                MapEntry<CollapsingTitle, CollapsingState>>(
                builder: (_, state) {
                  return Row(
                    children: [
                      _buildLineIcon(state),
                      _buildCollapsingLine(state)
                    ],
                  );
                },
              )
            : BlocBuilder<CollapsedHeadersHowWorkBloc,
                MapEntry<CollapsingTitle, CollapsingState>>(
                builder: (_, state) {
                  return Row(
                    children: [
                      _buildLineIcon(state),
                      _buildCollapsingLine(state)
                    ],
                  );
                },
              ));
  }
}
