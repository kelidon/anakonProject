import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PictureCheck extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PictureCheckState();

}

class _PictureCheckState extends State<PictureCheck>{

    bool isActive;
  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/logo_on_tower_2.png';
    final Widget logoOnTower = Image.asset(
      assetName,
    );

    return InkWell(
      onTap: (){
        setState(() {
          isActive = !isActive;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isActive?400:100,
        height: isActive?400:150,
        alignment: isActive?Alignment.centerLeft:Alignment.center,
        child: FittedBox(
          fit: BoxFit.cover,
          child: logoOnTower,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isActive = false;
  }

}
