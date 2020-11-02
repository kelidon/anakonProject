import 'dart:io';

import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PictureCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PictureCheckState();
}

class _PictureCheckState extends State<PictureCheck>
    with TickerProviderStateMixin {
  bool isActive;
  bool isActive1;
  double width;
  double height;
  double width1;
  double height1;

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/logo_on_tower_2.png';

    return Container(
      height: MediaQuery.of(context).size.height - 160,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !isActive1,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  alignment: isActive ? Alignment.centerLeft : Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: width,
                        height: height,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isActive = !isActive;
                                if (isActive) {
                                  isActive1 = false;
                                  width = 400;
                                  height = 400;
                                } else {
                                  width = 150;
                                  height = 100;
                                }
                              });
                            },
                            child:
                            Image.asset(assetName,
                            )
                        ),
                      ),
                      AnimatedOpacity(
                          opacity: isActive?0:1,
                          duration: Duration(milliseconds: 100),
                          child: Text("title", style: AppStyles.TITLE,))
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !isActive,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  alignment: isActive1 ? Alignment.centerLeft : Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: width1,
                        height: height1,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isActive1 = !isActive1;
                                if (isActive1) {
                                  isActive = false;
                                  width1 = 400;
                                  height1 = 400;
                                } else {
                                  width1 = 150;
                                  height1 = 100;
                                }
                              });
                            },
                            child:
                            Image.asset(assetName,
                            )
                        ),
                      ),
                      AnimatedOpacity(
                          opacity: isActive1?0:1,
                      duration: Duration(milliseconds: 100),
                      child: Text("title", style: AppStyles.TITLE,))
                    ],
                  ),
                ),
              ),
            ],
          ),
          AnimatedOpacity(
            opacity: isActive||isActive1?1:0,
            duration: Duration(milliseconds: 100),
            child: Container(
              height: MediaQuery.of(context).size.height - 160,
              margin: EdgeInsets.only(left: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("title", style: AppStyles.TITLE,),
                Text("description description description description description description description description "
                    "description description description description description description ")
              ],),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isActive = false;
    isActive1 = false;
    width = 150;
    height = 100;
    width1 = 150;
    height1 = 100;
  }
}
