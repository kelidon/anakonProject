import 'dart:ui';

import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_button_widget.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<MenuBloc, bool>(builder: (context, isEnabled) {
        isEnabled ? expandController.forward() : expandController.reverse();
        return SizeTransition(
          axis: Axis.vertical,
          axisAlignment: 1,
          sizeFactor: animation,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(1, 3)),
                ],
              ),
              width: isMouse ? MediaQuery.of(context).size.width * 0.15 : 150,
              margin: EdgeInsets.only(top: isMouse ? 0 : 40, bottom: 10),
              child: Container(
                margin: EdgeInsets.only(top: isMouse ? 20 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ScrollButtonWidget(
                              buttonName: DrawerButtons.ABOUT_US,
                              isTitle: true,
                              isMenu: true,
                              onTap: () => context.bloc<MenuBloc>().add(false),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ScrollButtonWidget(
                                      buttonName: DrawerButtons.ABOUT_US,
                                      onTap: () =>
                                          context.bloc<MenuBloc>().add(false),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ScrollButtonWidget(
                                      buttonName: DrawerButtons.SERVICES,
                                      onTap: () =>
                                          context.bloc<MenuBloc>().add(false),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ScrollButtonWidget(
                                      buttonName: DrawerButtons.HOW_WORK,
                                      onTap: () =>
                                          context.bloc<MenuBloc>().add(false),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
