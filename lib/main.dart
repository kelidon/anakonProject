import 'dart:developer';

import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/menu_widget.dart';
import 'package:anakonProject/widgets/colored_stripe_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
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
  ScrollController _stripeController;
  ScrollController _towerController;

  _mainScrollListener() {
    if (_towerController.hasClients && _stripeController.hasClients) {
      _towerController.jumpTo(_mainController.offset * 0.1);
      _stripeController.jumpTo(_mainController.offset * 0.03);
    }
  }

  @override
  void initState() {
    _mainController = ScrollController();
    _mainController.addListener(_mainScrollListener);
    _towerController = ScrollController();
    _stripeController = ScrollController();
    super.initState();
  }

  bool isMouse = true;
  int currentPictureIndex = 0;
  int currentPictureMobileIndex = 0;

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

    Widget _buildBackground() {
      return isMouse
          ? Row(
              children: [
                TowerWidget(
                  towerController: _towerController,
                ),
                Spacer(),
                ColoredStripeWidget(
                  stripeController: _stripeController,
                ),
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
                ColoredStripeWidget(
                  stripeController: _stripeController,
                ),
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
                  scrollThumbBuilder: (Color backgroundColor, double height,
                      {BoxConstraints labelConstraints, Text labelText}) {
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
    _towerController.dispose();
    _stripeController.dispose();
  }
}
