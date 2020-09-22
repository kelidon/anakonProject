import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ServicesWidgetState();

}

class _ServicesWidgetState extends State<ServicesWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.indigo.withOpacity(0.4),
        ),
        height: MediaQuery.of(context).size.height - 110,
        margin: EdgeInsets.only(
            right: 200, left: 280, top: 20, bottom: 20),
        child: Center(
            child:
            Text("services", style: TextStyle(fontSize: 50)))
    );
  }

}
