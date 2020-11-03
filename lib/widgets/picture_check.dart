import 'dart:io';

import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PictureCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PictureCheckState();
}

class _PictureCheckState extends State<PictureCheck>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/logo_menu.png';

    _buildPicture(CollapsingTitle titleType) {
      return BlocBuilder<CollapsedHeadersConsBloc,
          MapEntry<CollapsingTitle, CollapsingState>>(builder: (_, state) {
        bool isCollapsed =
            state.value == CollapsingState.COLLAPSED;
        bool isVisible =
            isCollapsed || state.key == titleType;
        var width
        return AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: isVisible ? 1 : 0,
          child: AnimatedContainer(
            color: Colors.green,
            duration: Duration(milliseconds: 200),
            alignment: isCollapsed ? Alignment.center : Alignment.centerLeft,
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: width,
                    height: height,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isActive = !isActive;
                            if (isActive) {
                              width = 400;
                              height = 400;
                            } else {
                              width = 150;
                              height = 100;
                            }
                          });
                        },
                        child: Image.asset(
                          assetName,
                          fit: BoxFit.contain,
                        )),
                  ),
                  AnimatedOpacity(
                      opacity: isVisible ? 0 : 1,
                      duration: Duration(milliseconds: 100),
                      child: Text(
                        "title",
                        style: AppStyles.TITLE,
                      ))
                ],
              ),
            ),
          ),
        );
      });
    }

    return BlocBuilder<MetricsBloc, Metrics>(builder: (_, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<CollapsedHeadersConsBloc,
          MapEntry<CollapsingTitle, CollapsingState>>(
        builder: (_, state) {
          bool isDetailsVisible = state.value == CollapsingState.EXPANDED;
          return Container(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      _buildPicture(CollapsingTitle.CONS_1),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: isDetailsVisible ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: Container(
                    margin: EdgeInsets.only(left: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "title",
                          style: AppStyles.TITLE,
                        ),
                        Text(
                            "description description description description description description description description "
                            "description description description description description description ")
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
