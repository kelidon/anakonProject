import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_button_widget.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<MenuBloc, bool>(builder: (context, isEnabled) {
        return AnimatedOpacity(
          opacity: isEnabled ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                color: isMouse ? Colors.white.withOpacity(1) : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(1, 3)
                  ),
                ],
              ),
              width: isMouse ? MediaQuery.of(context).size.width * 0.15 : 200,
              margin: EdgeInsets.only(top: isMouse ? 0 : 40),
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
                              onTap: () => context.bloc<MenuBloc>().add(false),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
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
                                  buttonName: DrawerButtons.HOW_WORK,
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
                                  buttonName: DrawerButtons.CONTACT_US,
                                  onTap: () =>
                                      context.bloc<MenuBloc>().add(false),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
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
