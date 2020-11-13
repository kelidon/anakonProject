import 'dart:developer';

import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:anakonProject/bloc/inner_scrolling/inner_scrolling_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroTargetWidget extends StatefulWidget {
  final BuildContext mainContext;
  final AnimatedTitle tag;
  final String titleTag;

  const HeroTargetWidget({Key key, this.tag, this.mainContext, this.titleTag})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _HeroTargetWidgetState();
}

class _HeroTargetWidgetState extends State<HeroTargetWidget> {
  ScrollController _controller;
  bool stopInnerScroll = false;

  _scrollListener() {
    if(stopInnerScroll){
      context.bloc<InnerScrollingBloc>().add(false);
    }
    if (_controller.position.outOfRange ||
        _controller.offset >= _controller.position.maxScrollExtent ||
        _controller.offset <= _controller.position.minScrollExtent) {
      setState(() {
        stopInnerScroll = true;
      });
    } else {
      context.bloc<InnerScrollingBloc>().add(true);
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(
        builder: (_, state) {
          bool isMouse = state == Metrics.BIG;
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Hero(
                tag: widget.titleTag,
                child: Center(
                  child: Text(
                    widget.titleTag,
                    style:  isMouse? AppStyles.TITLE:AppStyles.TITLE_M,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.bloc<InnerScrollingBloc>().add(false);
                        Navigator.pop(widget.mainContext);
                      },
                      child: Hero(
                        tag: widget.tag,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height * 0.6,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(AnimatedTypeToStateMapper
                                    .typeToStateMap[widget.tag].key),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  blurRadius: 5,
                                  offset: Offset(1, 3)),
                            ], // boxShadow
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              controller: _controller,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AnimatedTypeToStateMapper
                                        .typeToStateMap[widget.tag].value.key,
                                    style:  isMouse? AppStyles.TITLE:AppStyles.TITLE_M,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    AnimatedTypeToStateMapper
                                        .typeToStateMap[widget.tag].value.value,
                                    style: isMouse? AppStyles.REGULAR_SERVICES:AppStyles.REGULAR_SERVICES_M, textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
