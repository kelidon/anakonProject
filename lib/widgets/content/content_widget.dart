import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/widgets/content/about_us/about_us_widget.dart';
import 'package:anakonProject/widgets/content/how_work/how_work_widget.dart';
import 'package:anakonProject/widgets/content/services/services_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  final aboutKey = new GlobalKey();
  final howWorkWidget = new GlobalKey();
  final servicesKey = new GlobalKey();
  final contactKey = new GlobalKey();

  GlobalKey currentKey;

  @override
  void initState() {
    super.initState();
    currentKey = aboutKey;
  }

  @override
  Widget build(BuildContext context) {
    var _buttonToKey = {
      DrawerButtons.ABOUT_US: aboutKey,
      DrawerButtons.SERVICES: servicesKey,
      DrawerButtons.HOW_WORK: howWorkWidget
    };

    Widget _buildContentBlocks() {
      return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
        bool isMouse = state == Metrics.BIG;
        return BlocListener<DrawerBloc, DrawerButtons>(
            listenWhen: (prev, curr) => true,
            listener: (context, state) {
              print("content listen $state");
              setState(() {
                currentKey = _buttonToKey[state];
              });
              Scrollable.ensureVisible(
                _buttonToKey[state].currentContext,
                duration: Duration(milliseconds: 600),
              );
            },
            child: Container(
                child: Container(
                    alignment: Alignment.center,
                    margin: isMouse
                        ? EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.065,
                            left: MediaQuery.of(context).size.width * 0.15)
                        : null,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: isMouse?25:10),
                      child: Column(
                        children: [
                          Container(
                            key: aboutKey,
                            child: AboutUsWidget(
                              height: MediaQuery.of(context).size.height - 160,
                            ),
                          ),
                          Container(
                              key: servicesKey,
                              child: ServicesWidget(
                                height:
                                    MediaQuery.of(context).size.height - 150,
                              )),
                          Container(
                            key: howWorkWidget,
                            child: HowWorkWidget(
                              height: MediaQuery.of(context).size.height - 160,
                            ),
                          ),
                        ],
                      ),
                    ))));
      });
    }

    List<GlobalKey> keysList = _buttonToKey.values.toList();
    List<DrawerButtons> buttonsList = _buttonToKey.keys.toList();

    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
        bool isMouse = state == Metrics.BIG;
        return isMouse
            ? Listener(
                onPointerSignal: (PointerSignalEvent event) {
                  if (event is PointerScrollEvent) {
                    var currentIndex = keysList.indexOf(currentKey);
                    var isLastElement = currentIndex == keysList.length - 1;
                    var isFirstElement = currentIndex == 0;

                    if (event.scrollDelta.dy > 0 && !isLastElement) {
                      context
                          .bloc<DrawerBloc>()
                          .add(buttonsList[currentIndex + 1]);
                    } else if (event.scrollDelta.dy < 0 && !isFirstElement) {
                      context
                          .bloc<DrawerBloc>()
                          .add(buttonsList[currentIndex - 1]);
                    }
                  }
                },
                child: _buildContentBlocks(),
              )
            : Listener(
                onPointerMove: (PointerMoveEvent event) {
                  if (context.bloc<DrawerBloc>().state != null)
                    context.bloc<DrawerBloc>().add(null);
                },
                child: _buildContentBlocks());
      });
    });
  }
}
