import 'dart:developer';

import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        ];
      }
      List<Widget> items = [];
      for (int i = 0; i < titles.length; i++) {
        items.add(
          HeroTableItem(
            mainContext: widget.mainContext,
            tag: titles[i],
            titleTag: widget.title,
          ));
      }
      return items;
    }
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        bool isMouse = state == Metrics.BIG;
        return isMouse?Row(
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
                      style:  isMouse? AppStyles.TITLE:AppStyles.TITLE_M,
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
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: _buildTableRowsMobile());
      }
    );
  }
}
