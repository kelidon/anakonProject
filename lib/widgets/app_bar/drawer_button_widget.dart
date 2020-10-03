import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollButtonWidget extends StatefulWidget {
  final bool isTitle;
  final bool isAppBar;
  final DrawerButtons buttonName;
  final Function onTap;

  const ScrollButtonWidget(
      {Key key,
      this.isTitle = false,
      this.buttonName,
      this.onTap,
      this.isAppBar = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ScrollButtonWidgetState(onTap, isTitle, buttonName, isAppBar);
}

class _ScrollButtonWidgetState extends State<ScrollButtonWidget> {
  final bool isTitle;
  final bool isAppBar;
  final DrawerButtons buttonName;
  final Function onTap;

  _ScrollButtonWidgetState(
      this.onTap, this.isTitle, this.buttonName, this.isAppBar);

  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerButtons>(builder: (context, state) {
      var _style = state == buttonName
          ? AppStyles.DRAWER_BUTTON_ACTIVE
          : AppStyles.DRAWER_BUTTON;
      _color = state == buttonName ? Color(0xFF06285A) : Colors.transparent;
      final Size size = (TextPainter(
              text:
                  TextSpan(text: drawerButtonLabels[buttonName], style: _style),
              maxLines: 1,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              textDirection: TextDirection.ltr)
            ..layout())
          .size;
      final String assetName = 'assets/images/anakon_logo.svg';
      final Widget svgLogo = Image.network(
        assetName,
      );

      return InkWell(
        hoverColor: Colors.transparent,
        onTap: context.bloc<MenuBloc>().state || isAppBar
            ? () {
                context.bloc<DrawerBloc>().add(buttonName);
                setState(() {});
                onTap();
              }
            : null,
        child: isTitle
            ? Container(child: svgLogo)
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      drawerButtonLabels[buttonName],
                      style: _style,
                    ),
                    AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: size.width + 20,
                        height: 2,
                        color: _color)
                  ],
                ),
              ),
      );
    });
  }
}
