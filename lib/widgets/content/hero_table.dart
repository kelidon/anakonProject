import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_table_item.dart';

class HeroTableWidget extends StatefulWidget {
  final BuildContext mainContext;
  final String title;

  const HeroTableWidget({Key key, this.mainContext, this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeroTableWidgetState();
}

class _HeroTableWidgetState extends State<HeroTableWidget> {
  @override
  Widget build(BuildContext context) {
    _buildTableRows() {
      List<AnimatedTitle> titles;
      if (widget.title == AppText.ABOUT_US_TITLE) {
        titles = [
          AnimatedTitle.CONS_1,
          AnimatedTitle.CONS_2,
          AnimatedTitle.CONS_3,
          AnimatedTitle.CONS_4
        ];
      } else if (widget.title == AppText.HOW_WORK_TITLE) {
        titles = [
          AnimatedTitle.HOW_WORK_1,
          AnimatedTitle.HOW_WORK_2,
          AnimatedTitle.HOW_WORK_3,
          null
        ];
      }
      List<TableRow> tableRows = [];
      for (int i = 0; i < titles.length; i += 2) {
        var row = TableRow(children: [
          HeroTableItem(
            mainContext: widget.mainContext,
            tag: titles[i],
            titleTag: widget.title,
          ),
          titles[i + 1] == null
              ? Container()
              : HeroTableItem(
                  mainContext: widget.mainContext,
                  tag: titles[i + 1],
                  titleTag: widget.title,
                )
        ]);
        tableRows.add(row);
      }
      return tableRows;
    }

    _buildTableRowsMobile() {
      List<AnimatedTitle> titles;
      if (widget.title == AppText.ABOUT_US_TITLE) {
        titles = [
          AnimatedTitle.CONS_1,
          AnimatedTitle.CONS_2,
          AnimatedTitle.CONS_3,
          AnimatedTitle.CONS_4
        ];
      } else if (widget.title == AppText.HOW_WORK_TITLE) {
        titles = [
          AnimatedTitle.HOW_WORK_1,
          AnimatedTitle.HOW_WORK_2,
          AnimatedTitle.HOW_WORK_3,
          null
        ];
      }
      List<TableRow> tableRows = [];
      for (int i = 0; i < titles.length; i++) {
        var row = TableRow(children: [
          HeroTableItem(
            mainContext: widget.mainContext,
            tag: titles[i],
            titleTag: widget.title,
          ),
        ]);
        tableRows.add(row);
      }
      return tableRows;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.title,
              child: Container(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  widget.title.split(" ").join("\n"),
                  style: AppStyles.TITLE,
                ),
              ),
            ),
          ],
        ),
        Table(
            defaultColumnWidth:
                FixedColumnWidth(MediaQuery.of(context).size.width / 4),
            children: _buildTableRows()),
      ],
    );
  }
}
