import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollButtonWidget extends StatefulWidget {
  final bool isTitle;
  final bool isMenu;
  final DrawerButtons buttonName;
  final Function onTap;

  const ScrollButtonWidget(
      {Key key,
      this.isTitle = false,
      this.buttonName,
      this.onTap,
      this.isMenu = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ScrollButtonWidgetState(onTap, isTitle, buttonName, isMenu);
}

class _ScrollButtonWidgetState extends State<ScrollButtonWidget> {
  final bool isTitle;
  final bool isMenu;
  final DrawerButtons buttonName;
  final Function onTap;

  _ScrollButtonWidgetState(
      this.onTap, this.isTitle, this.buttonName, this.isMenu);

  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (_, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<DrawerBloc, DrawerButtons>(builder: (context, state) {
        var _style =
            isMouse ? AppStyles.DRAWER_BUTTON : AppStyles.DRAWER_BUTTON_M;
        _color = state == buttonName ? Color(0xFF06285A) : Colors.transparent;
        final Size size = (TextPainter(
                text: TextSpan(
                    text: drawerButtonLabels[buttonName], style: _style),
                maxLines: 1,
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                textDirection: TextDirection.ltr)
              ..layout())
            .size;
        final String assetName = isMenu
            ? 'assets/images/logo_menu.png'
            : 'assets/images/logo_appbar.png';
        final Widget logoWidget = BlocBuilder<MetricsBloc, Metrics>(
          builder: (context, state) {
            bool isMouse = state != Metrics.SMALL;
            return Image.asset(
              assetName,
              scale: isMouse
                  ? 1
                  : isMenu
                      ? 2
                      : 3,
            );
          },
        );

        return InkWell(
          hoverColor: Colors.transparent,
          onTap: context.bloc<MenuBloc>().state || isMenu || isTitle
              ? () {
                  context.bloc<DrawerBloc>().add(buttonName);
                  setState(() {});
                  onTap();
                }
              : null,
          child: isTitle
              ? Container(child: logoWidget)
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        drawerButtonLabels[buttonName],
                        style: _style,
                      ),
                      AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: size.width + 10,
                          height: 1,
                          color: _color)
                    ],
                  ),
                ),
        );
      });
    });
  }
}
