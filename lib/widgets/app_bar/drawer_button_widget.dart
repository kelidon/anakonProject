import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollButtonWidget extends StatefulWidget {
  final bool isTitle;
  final DrawerButtons buttonName;
  final Function onTap;
  final bool isDrawer;

  const ScrollButtonWidget({Key key, this.isTitle  = false, this.buttonName, this.onTap, this.isDrawer = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollButtonWidgetState(onTap, isTitle, buttonName, isDrawer);
}
  class _ScrollButtonWidgetState extends State<ScrollButtonWidget> {
  final bool isTitle;
  final DrawerButtons buttonName;
  final Function onTap;
  final bool isDrawer;

  _ScrollButtonWidgetState(this.onTap, this.isTitle, this.buttonName, this.isDrawer);

  Color _color = Colors.transparent;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerButtons>(
      builder: (context, state) {
        var _style = state == buttonName
            ? AppStyles.DRAWER_BUTTON_ACTIVE
            : AppStyles.DRAWER_BUTTON;
              _color = state == buttonName? Color(0xFF020E31) : Colors.transparent;
        final Size size = (TextPainter(
            text: TextSpan(text:  drawerButtonLabels[buttonName], style: _style),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
            .size;
        return InkWell(
          onTap: () {
            context.bloc<DrawerBloc>().add(buttonName);
            setState(() {

            });
            onTap();
            if(isDrawer) Navigator.of(context).pop();
          },
          child: isTitle?
          Container(
            child:  Image.asset("assets/images/logo.png", scale: 3),
          ):Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  drawerButtonLabels[buttonName],
                  style: _style,
                ),

                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                        width: size.width + 20,
                        height: 2,
                        color: _color
                    )
              ],
            ),
          ),
        );
      }
    );
  }
}
