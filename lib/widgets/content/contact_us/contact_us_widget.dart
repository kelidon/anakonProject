import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsWidget extends StatefulWidget {
  final double height;

  const ContactUsWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactUsWidgetState(height);
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  final double height;

  _ContactUsWidgetState(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.indigo.withOpacity(0.4),
        ),
        height: MediaQuery.of(context).size.height - 110,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child:
            Center(child: Text("contact us", style: TextStyle(fontSize: 50))));
  }
}
