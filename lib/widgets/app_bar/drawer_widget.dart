import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drawer_button_widget.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.clear, size: 30, color: Colors.grey,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DrawerButtonWidget(
                        buttonName: DrawerButtons.ANAKON,
                        isTitle: true,
                        onTap: (){},
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      DrawerButtonWidget(
                        buttonName: DrawerButtons.WHO_WE_ARE,
                        onTap: (){},
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      DrawerButtonWidget(
                        buttonName: DrawerButtons.SERVICES,
                        onTap: (){},
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      DrawerButtonWidget(
                        buttonName: DrawerButtons.CONTACT_US,
                        onTap: (){},
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
  }

}
