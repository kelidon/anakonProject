import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  final aboutKey = new GlobalKey();
  final servicesKey = new GlobalKey();
  final contactKey = new GlobalKey();

  List<GlobalKey> keysList;
  GlobalKey currentKey;

  @override
  void initState() {
    super.initState();
    currentKey = aboutKey;
    keysList = [aboutKey, servicesKey, contactKey];
  }

  @override
  Widget build(BuildContext context) {
    var _buttonToKey = {
      DrawerButtons.ANAKON: aboutKey,
      DrawerButtons.WHO_WE_ARE: aboutKey,
      DrawerButtons.SERVICES: servicesKey,
      DrawerButtons.CONTACT_US: contactKey
    };

    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          print("event ok");
          var currentIndex = keysList.indexOf(currentKey);
          var isLastElement = currentIndex == keysList.length - 1;
          var isFirstElement = currentIndex == 0;
          if (event.scrollDelta.dy > 0 && !isLastElement) {
            print("event scroll down");
            currentKey = keysList[currentIndex + 1];
          } else if (event.scrollDelta.dy < 0 && !isFirstElement) {
            print("event scroll up");
            currentKey = keysList[currentIndex - 1];
          }
          Scrollable.ensureVisible(
            currentKey.currentContext,
            alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          );
        }
      },
      child: BlocListener<DrawerBloc, DrawerButtons>(
        listener: (context, state) {
          setState(() {
            currentKey = _buttonToKey[state];
          });
          Scrollable.ensureVisible(
            _buttonToKey[state].currentContext,
            alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          );
        },
        child: Container(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                        key: aboutKey,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.indigo.withOpacity(0.4),
                        ),
                        height: 700,
                        margin: EdgeInsets.only(
                            right: 200, left: 280, top: 20, bottom: 20),
                        child: Center(
                            child:
                                Text("about", style: TextStyle(fontSize: 50)))),
                    Container(
                        key: servicesKey,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.indigo.withOpacity(0.6),
                        ),
                        height: 700,
                        margin: EdgeInsets.only(
                            right: 200, left: 280, top: 20, bottom: 20),
                        child: Center(
                            child: Text("services",
                                style: TextStyle(fontSize: 50)))),
                    Container(
                        key: contactKey,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.indigo.withOpacity(0.2),
                        ),
                        height: 700,
                        margin: EdgeInsets.only(
                            right: 200, left: 280, top: 20, bottom: 20),
                        child: Center(
                            child: Text("contact",
                                style: TextStyle(fontSize: 50)))),
                  ],
                ))),
      ),
    );
  }
}
