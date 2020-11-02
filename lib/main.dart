import 'dart:developer';

import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/menu_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
import 'package:anakonProject/widgets/content/inner_widgets/contacts_overlay_widget.dart';
import 'package:anakonProject/widgets/tower_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file:///C:/Users/vshch/Downloads/anakonProject/lib/widgets/blur_widget.dart';

import 'bloc/collapsing_headers/collapsing_headers_bloc.dart';
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
        BlocProvider<CollapsedHeadersConsBloc>(
          create: (_) => CollapsedHeadersConsBloc(),
        ),
        BlocProvider<CollapsedHeadersHowWorkBloc>(
          create: (_) => CollapsedHeadersHowWorkBloc(),
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

class _ApplicationPageState extends State<ApplicationPage> {
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

    _blurController = ScrollController();

    super.initState();
  }

  bool isMouse = true;

  @override
  Widget build(BuildContext context) {
    isMouse = MediaQuery.of(context).size.width > 1000;
    print("width: ${MediaQuery.of(context).size.width}");
    context.bloc<MetricsBloc>().add(isMouse ? Metrics.BIG : Metrics.SMALL);

    Widget _buildBackground() {
      return isMouse
          ? Row(
              children: [
                TowerWidget(towerController: _towerController),
                Spacer(),
                BlurWidget(
                  blurController: _blurController,
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TowerWidget(towerController: _towerController),
                Spacer(),
                BlurWidget(
                  blurController: _blurController,
                ),
              ],
            );
    }

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBarWidget(
                preferredSize: Size.fromHeight(isMouse ? 70 : 40),
              ),
              body: Container(
                margin: isMouse ? null : EdgeInsets.only(bottom: 50, top: 40),
                child: SingleChildScrollView(
                    physics: isMouse
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    controller: _mainController,
                    child: ContentWidget()),
              )),
          _buildBackground(),
          MenuWidget(),
          ContactsOverlayWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
    _towerController.dispose();
    _blurController.dispose();
  }
}
