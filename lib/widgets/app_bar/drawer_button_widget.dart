import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerButtonWidget extends StatelessWidget {
  final bool isTitle;
  final DrawerButtons buttonName;
  final Function onTap;

  DrawerButtonWidget({this.onTap, this.isTitle = false, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerButtons>(
      builder: (context, state) {
        var _style = isTitle
            ? AppStyles.DRAWER_TITLE
            : state == buttonName
            ? AppStyles.DRAWER_BUTTON_ACTIVE
            : AppStyles.DRAWER_BUTTON;
        return InkWell(
          onTap: () {
            context.bloc<DrawerBloc>().add(buttonName);
            onTap();
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              drawerButtonLabels[buttonName],
              style: _style,
            ),
          ),
        );
      }
    );
  }
}
