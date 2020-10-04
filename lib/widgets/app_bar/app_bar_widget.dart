import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_button_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({Key key, this.preferredSize}) : super(key: key);

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<MenuBloc, bool>(builder: (context, isEnabled) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: isMouse
                ? EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.065,
                    left: MediaQuery.of(context).size.width * 0.15)
                : null,
            //color: Colors.white.withOpacity(0.8),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        child: Icon(
                          isEnabled ? Icons.clear : Icons.menu,
                          color: Color(0xFF06285A),
                        ),
                        onTap: () {
                          context
                              .bloc<MenuBloc>()
                              .add(!context.bloc<MenuBloc>().state);
                        },
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("+375 (33) 354-76-45",
                              style: TextStyle(
                                  color: Color(0xFF06285A),
                                  fontWeight: FontWeight.w600)),
                          Text("anakon@gmail.com",
                              style: TextStyle(
                                  color: Color(0xFF06285A),
                                  fontWeight: FontWeight.w600))
                        ],
                      )),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: isMouse ? 12 : 4),
                  child: Center(
                    child: ScrollButtonWidget(
                      buttonName: DrawerButtons.ABOUT_US,
                      isTitle: true,
                      isAppBar: true,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 5)
           ),
          ],// boxShadow
         ),
        );
      });
    });
  }
}
