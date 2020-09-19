import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    FlatButton(
                      onPressed: null,
                      child: Text(
                        "Anakon",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FlatButton(
                        onPressed: null,
                        child: Text(
                          "Who are we",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    FlatButton(
                        onPressed: null,
                        child: Text(
                          "What are we doing",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    FlatButton(
                        onPressed: null,
                        child: Text(
                          "Contact us",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
