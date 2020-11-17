import 'dart:developer';

import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/menu_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
import 'package:anakonProject/widgets/content/inner_widgets/contacts_overlay_widget.dart';
import 'package:anakonProject/widgets/content/inner_widgets/custom_scroll_bar.dart';
import 'package:anakonProject/widgets/content/services/bottom_sheet.dart';
import 'package:anakonProject/widgets/tower_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/servises_items/services_items_bloc.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerBloc>(
          create: (_) => DrawerBloc(),
        ),
        BlocProvider<MetricsBloc>(
          create: (_) => MetricsBloc(),
        ),
        BlocProvider<MenuBloc>(
          create: (_) => MenuBloc(),
        ),
        BlocProvider<ServicesItemsBloc>(
          create: (_) => ServicesItemsBloc(),
        ),
        BlocProvider<ContactsOverlayBloc>(
          create: (_) => ContactsOverlayBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Anakon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Poppins'),
        home: ApplicationPage(),
      ),
    );
  }
}

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with TickerProviderStateMixin {
  ScrollController _mainController;
  ScrollController _blurController;
  ScrollController _towerController;

  _mainScrollListener() {
    if (_towerController.hasClients && _blurController.hasClients) {
      _towerController.jumpTo(_mainController.offset * 0.1);
      _blurController.jumpTo(_mainController.offset * 0.03);
    }
  }

  @override
  void initState() {
    _mainController = ScrollController();
    _mainController.addListener(_mainScrollListener);
    _towerController = ScrollController();
    _blurController = ScrollController();
    super.initState();
  }

  bool isMouse = true;
  int currentPictureIndex = 0;
  int currentPictureMobileIndex = 0;
  var pictures = [
    "assets/images/blur.jpg",
    "assets/images/new_blur_1.jpg",
    "assets/images/new_blur_1_blur.jpg",
    "assets/images/new_blur_2.jpg",
    "assets/images/new_blur_2_blur.jpg",
    "assets/images/new_blur_3.jpg",
    "assets/images/new_blur_3_blur.jpg"
  ];
  var picturesMobile = [
    "assets/images/blur_horizontal.png",
    "assets/images/logo_on_tower.png"
  ];

  @override
  Widget build(BuildContext context) {
    BottomSheetWidget().setContext(context);
    print(
        "width: ${MediaQuery.of(context).size.width}, height: ${MediaQuery.of(context).size.height}");
    isMouse = MediaQuery.of(context).size.width > 1000;
    if (MediaQuery.of(context).size.width > 1400) {
      context.bloc<MetricsBloc>().add(Metrics.BIG);
    } else if (MediaQuery.of(context).size.width > 1000) {
      context.bloc<MetricsBloc>().add(Metrics.MEDIUM);
    } else {
      context.bloc<MetricsBloc>().add(Metrics.SMALL);
    }

    Widget _buildBlur() {
      return isMouse
          ? Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _blurController,
                    child: Image(
                      image: AssetImage(pictures[currentPictureIndex]),
                      width: MediaQuery.of(context).size.width * 0.065,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: Center(
                      child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Column(
                      children: [
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("А",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("Н",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("А",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("К",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("О",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text("Н",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 100))),
                      ],
                    ),
                  )),
                ),
              ],
            )
          : Stack(children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: Image.asset(
                    picturesMobile[currentPictureMobileIndex],
                    height: 50,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                  height: 50,
                  child: Center(
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text("АНАКОН",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 100,
                                  letterSpacing: 40))))),
            ]);
    }

    Widget _buildBackground() {
      return isMouse
          ? Row(
              children: [
                TowerWidget(
                  towerController: _towerController,
                ),
                Spacer(),
                _buildBlur(),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TowerWidget(
                  towerController: _towerController,
                ),
                Spacer(),
                _buildBlur(),
              ],
            );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBarWidget(
                preferredSize: Size.fromHeight(isMouse ? 70 : 40),
              ),
              body: Container(
                margin: isMouse
                    ? EdgeInsets.only(bottom: 5)
                    : EdgeInsets.only(bottom: 50, top: 40),
                child: CustomDraggableScrollbar(
                  heightScrollThumb: 60,
                  alwaysVisibleScrollThumb: true,
                  backgroundColor: AppColors.PRIMARY,
                  controller: _mainController,
                  scrollThumbBuilder: (Color backgroundColor,
                      Animation<double> thumbAnimation,
                      Animation<double> labelAnimation,
                      double height,
                      {BoxConstraints labelConstraints,
                      Text labelText}) {
                    final scrollThumb = Material(
                      elevation: 4.0,
                      child: Container(
                        constraints: BoxConstraints.tight(
                          Size(MediaQuery.of(context).size.width * 0.006 + 3,
                              height),
                        ),
                      ),
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    );
                    return Container(
                        margin: EdgeInsets.only(
                            right: isMouse
                                ? MediaQuery.of(context).size.width * 0.065 + 3
                                : 0),
                        child: scrollThumb);
                  },
                  child: ListView.builder(
                    physics: isMouse ? NeverScrollableScrollPhysics() : null,
                    controller: _mainController,
                    itemCount: 1,
                    itemBuilder: (_, i) {
                      return ContentWidget();
                    },
                  ),
                ),
              )),
          MenuWidget(),
          ContactsOverlayWidget(),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  currentPictureIndex =
                      currentPictureIndex == pictures.length - 1
                          ? 0
                          : currentPictureIndex + 1;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //_desktopVideoController.dispose();
    _mainController.dispose();
    _towerController.dispose();
    _blurController.dispose();
  }
}
