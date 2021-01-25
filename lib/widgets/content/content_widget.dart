import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/widgets/content/about_us/about_us_widget.dart';
import 'package:anakonProject/widgets/content/how_work/how_work_widget.dart';
import 'package:anakonProject/widgets/content/services/services_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentWidget extends StatefulWidget {
  final ScrollController mainController;
  const ContentWidget({Key key, this.mainController}) : super(key: key);

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
  bool lockScroll = false;


  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var _buttonToKey = {
      DrawerButtons.ABOUT_US: aboutKey,
      DrawerButtons.SERVICES: servicesKey,
      DrawerButtons.HOW_WORK: howWorkWidget
    };

    Widget _buildContentBlocks() {
      return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
        bool isMouse = state != Metrics.SMALL;
        return BlocListener<DrawerBloc, DrawerButtons>(
            listenWhen: (prev, curr) => true,
            listener: (context, state) {
              setState(() {
                currentKey = _buttonToKey[state];
              });
              Scrollable.ensureVisible(_buttonToKey[state].currentContext,
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.easeInOutSine);
            },
            child: Container(
                alignment: Alignment.center,
                padding: isMouse
                    ? EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.065,
                        left: MediaQuery.of(context).size.width * 0.15)
                    : null,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: isMouse ? 25 : 10),
                  child: Column(
                    children: [
                      Container(
                        key: aboutKey,
                        child: AboutUsWidget(),
                      ),
                      Container(key: servicesKey, child: ServicesWidget()),
                      Container(
                        key: howWorkWidget,
                        child: HowWorkWidget(),
                      ),
                    ],
                  ),
                )));
      });
    }

    List<GlobalKey> keysList = _buttonToKey.values.toList();
    List<DrawerButtons> buttonsList = _buttonToKey.keys.toList();

    void _handleKeyEvent(RawKeyEvent event) {
      if (!lockScroll) {
        setState(() {
          lockScroll = true;
        });
        var offset = widget.mainController.offset;
        var delta = 180;
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          setState(() {
            widget.mainController.position.moveTo(offset-delta, curve: Curves.linear, duration: Duration(milliseconds: 500)).then((value) {
              setState(() {
                lockScroll = false;
              });
            });
          });
        }
        else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          setState(() {
            widget.mainController.position.moveTo(offset+delta, curve: Curves.linear, duration: Duration(milliseconds: 500)).then((value) {
              setState(() {
                lockScroll = false;
              });
            });
          });
        }
      }

    }
        return RawKeyboardListener(
            onKey: _handleKeyEvent,
            focusNode: _focusNode,
            autofocus: true,
            child: _buildContentBlocks()
        );
  }
}
