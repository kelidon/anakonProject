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
              width: isMouse ? MediaQuery.of(context).size.width * 0.15 : 200,
              color: Colors.white.withOpacity(0.9),
              margin: EdgeInsets.only(top: isMouse ? 0 : 40),
              child: Container(
                margin: EdgeInsets.only(left: 15, top: isMouse ? 20 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25, top: 20),
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
                          SizedBox(
                            height: 30,
                          ),
                          ScrollButtonWidget(
                            buttonName: DrawerButtons.ABOUT_US,
                            onTap: () => context.bloc<MenuBloc>().add(false),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ScrollButtonWidget(
                            buttonName: DrawerButtons.SERVICES,
                            onTap: () => context.bloc<MenuBloc>().add(false),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ScrollButtonWidget(
                            buttonName: DrawerButtons.CONTACT_US,
                            onTap: () => context.bloc<MenuBloc>().add(false),
                          ),
                          SizedBox(
                            height: 20,
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
