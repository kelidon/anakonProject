import 'package:flutter/cupertino.dart';

class CollapsingLinesWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CollapsingWidgetState();

}

class _CollapsingWidgetState extends State<CollapsingLinesWidget>{
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200)
    );
  }

}
