
import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer_button_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({Key key})
      : preferredSize = Size.fromHeight(70),
        super(key: key);

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
            padding: EdgeInsets.only(left: 15),
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.085, left: MediaQuery.of(context).size.width*0.2),
            width: MediaQuery.of(context).size.width - 2000/MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.1,
            color: Colors.white.withOpacity(0.8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                //isMouse?Container(width: 46,):
                Builder(builder: (context) {
                  return IconButton(
                    splashRadius: 1,
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xFF0B277A),
                    ),
                    onPressed: () {
                      if (Scaffold.of(context).isDrawerOpen) {
                        Scaffold.of(context).openEndDrawer();
                      } else {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                  );
                }),
                Spacer(flex: 2,),
                // isMouse?ScrollButtonWidget(
                //   buttonName: DrawerButtons.SERVICES,
                //   isDrawer: false,
                //   onTap: (){},
                // ):Container(),
                Spacer(flex: 1,),
                ScrollButtonWidget(
                  buttonName: DrawerButtons.ABOUT_US,
                  isDrawer: false,
                  isTitle: true,
                  onTap: (){},
                ),
                Spacer(flex: 1,),
                // isMouse?ScrollButtonWidget(
                //   buttonName: DrawerButtons.CONTACT_US,
                //   isDrawer: false,
                //   onTap: (){},
                // ):Container(),
                Spacer(flex: 2,),
                Container(
                    margin: EdgeInsets.only (right: 15),
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ПОЗВОНИТЕ НАМ", style: TextStyle(color: Color(0xFF0B277A))),
                        Text("+375 (33) 354-76-45",style: TextStyle(color: Color(0xFF0B277A))),
                        Text("anakon@gmail.com",style: TextStyle(color: Color(0xFF0B277A)))
                      ],
                    )
                )
              ],
            )
        );
      }
    );
  }
}
