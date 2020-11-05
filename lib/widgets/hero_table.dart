import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/hero_table_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroTableWidget extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;
  final BuildContext mainContext;
  final AnimatedPicturesBloc bloc;
  final String title;

  const HeroTableWidget(
      {Key key, this.navKey, this.mainContext, this.bloc, this.title})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _HeroTableWidgetState();
}

class _HeroTableWidgetState extends State<HeroTableWidget> {
  @override
  Widget build(BuildContext context) {
    _buildTableRows() {
      List<AnimatedTitle> titles;
      if (widget.bloc is AnimatedPicturesFirstBloc) {
        titles = [
          AnimatedTitle.CONS_1,
          AnimatedTitle.CONS_2,
          AnimatedTitle.CONS_3,
          AnimatedTitle.CONS_4
        ];
      } else if (widget.bloc is AnimatedPicturesSecondBloc) {
        titles = [
          AnimatedTitle.HOW_WORK_1,
          AnimatedTitle.HOW_WORK_2,
          AnimatedTitle.HOW_WORK_3,
          null
        ];
      }
      List<TableRow> tableRows;
      for (int i = 0; i < titles.length; i += 2) {
        var row = TableRow(children: [
          HeroTableItem(
            navKey: widget.navKey,
            mainContext: widget.mainContext,
            tag: titles[i],
            titleTag: widget.title,
          ),
          titles[i + 1] == null
              ? Container()
              : HeroTableItem(
                  navKey: widget.navKey,
                  mainContext: widget.mainContext,
                  tag: titles[i + 1],
                  titleTag: widget.title,
                )
        ]);
        tableRows.add(row);
      }
    }

    return Row(
      children: [
        Hero(
          tag: widget.title,
          child: Center(
            child: Text(
              widget.title,
              style: AppStyles.TITLE,
            ),
          ),
        ),
        Table(
            defaultColumnWidth:
                FixedColumnWidth(MediaQuery.of(context).size.width / 4),
            children: _buildTableRows()),
      ],
    );
  }
}
