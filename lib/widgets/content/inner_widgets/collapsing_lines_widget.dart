import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:flutter/cupertino.dart';

class CollapsingLinesWidget extends StatefulWidget{
  final CollapsingTitle titleType;
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
