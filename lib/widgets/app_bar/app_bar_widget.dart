import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/fonts_icons/anakon_greek_icons.dart';
import 'package:anakonProject/widgets/content/inner_widgets/contacts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      bool isMouse = state != Metrics.SMALL;
      return BlocBuilder<MenuBloc, bool>(builder: (context, isEnabled) {
        return Container(
          margin: isMouse ? EdgeInsets.only(top: 5) : null,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMouse ? 25 : 10, vertical: 5),
            margin: isMouse
                ? EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.075,
                    left: MediaQuery.of(context).size.width * 0.16)
                : null,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  isMouse ? BorderRadius.all(Radius.circular(20)) : null,
              boxShadow: isMouse
                  ? [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 5)),
                    ]
                  : [], // boxShadow
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        child: Icon(
                          isEnabled
                              ? AnakonGreek.menu_exp
                              : AnakonGreek.menu_col,
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
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      content: ContactsWidget(),
                                    ));
                          },
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(AppText.CONTACTS_NUMBER,
                                  style: state != Metrics.SMALL
                                      ? AppStyles.CONTACTS_APPBAR
                                      : AppStyles.CONTACTS_APPBAR_M),
                              Text(AppText.CONTACTS_GMAIL,
                                  style: state != Metrics.SMALL
                                      ? AppStyles.CONTACTS_APPBAR
                                      : AppStyles.CONTACTS_APPBAR_M)
                            ],
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: isMouse ? 12 : 4),
                  child: Center(
                    child: ScrollButtonWidget(
                      buttonName: DrawerButtons.ABOUT_US,
                      isTitle: true,
                      isMenu: false,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
