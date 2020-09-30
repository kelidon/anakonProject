
import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_button_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({Key key, this.preferredSize})
      : super(key: key);

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (context, state) {
        bool isMouse = state == Metrics.BIG;
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: isMouse?EdgeInsets.only(right: MediaQuery.of(context).size.width*0.1, left: MediaQuery.of(context).size.width*0.2):null,
            width: MediaQuery.of(context).size.width - 2000/MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.1,
            color: Colors.white.withOpacity(0.8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return Center(
                    child: InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Color(0xFF0B277A),
                      ),
                      onTap: () {
                        if (Scaffold.of(context).isDrawerOpen) {
                          Scaffold.of(context).openEndDrawer();
                        } else {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                    ),
                  );
                }),
                Spacer(),
                ScrollButtonWidget(
                  buttonName: DrawerButtons.ABOUT_US,
                  isDrawer: false,
                  isTitle: true,
                  onTap: (){},
                ),
                Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("+375 (33) 354-76-45",style: TextStyle(color: Color(0xFF0B277A))),
                          Text("anakon@gmail.com",style: TextStyle(color: Color(0xFF0B277A)))
                        ],
                      )
                  ),
                )
              ],
            )
        );
      }
    );
  }
}
