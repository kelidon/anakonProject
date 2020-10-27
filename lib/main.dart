import 'dart:developer';

import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/menu_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:video_player/video_player.dart';

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

class _ApplicationPageState extends State<ApplicationPage> with TickerProviderStateMixin {
  ScrollController _mainController;
  ScrollController _blurController;
  ScrollController _towerController;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  GifController controller;

  VideoPlayerController _controllerHorizontal;
  Future<void> _initializeVideoPlayerFutureHorizontal;

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
    _controller = VideoPlayerController.asset("assets/video/tower.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();

    controller= GifController(vsync: this);
    controller.animateTo(0.5, duration: Duration(milliseconds:1000));

    _controllerHorizontal =
        VideoPlayerController.asset("assets/video/tower_horizontal.mp4");
    _initializeVideoPlayerFutureHorizontal = _controller.initialize();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.setVolume(0);
      _controller.play();
      _controller.setLooping(true);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controllerHorizontal.setVolume(0);
      _controllerHorizontal.play();
      _controllerHorizontal.setLooping(true);
    });
    super.initState();
  }

  bool isMouse = true;

  @override
  Widget build(BuildContext context) {
    isMouse = MediaQuery.of(context).size.width > 1000;
    print("width: ${MediaQuery.of(context).size.width}");
    context.bloc<MetricsBloc>().add(isMouse ? Metrics.BIG : Metrics.SMALL);

    final String assetName = 'assets/images/logo_on_tower_2.png';
    final Widget logoOnTower = Image.asset(
      assetName,
    );

    Widget _buildTower() {
      return isMouse
          ? Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1),
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _towerController,
                          child: BlocBuilder<MetricsBloc, Metrics>(
                              builder: (context, state) {
                            if (state == Metrics.BIG) {
                              _initializeVideoPlayerFuture = null;
                              _initializeVideoPlayerFuture =
                                  _controller.initialize();
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                _controller.setVolume(0);
                                _controller.play();
                                _controller.setLooping(true);
                              });
                            }
                            return Container(
                              child: FutureBuilder(
                                  future: _initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        child: VideoPlayer(_controller),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                            );
                          })),
                      Column(
                        children: [
                          Spacer(),
                          Container(
                            child: Container(child: logoOnTower),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          : Container(
              alignment: Alignment.topLeft,
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: BlocBuilder<MetricsBloc, Metrics>(
                    builder: (context, state) {
                  if (state == Metrics.SMALL) {
                    _initializeVideoPlayerFutureHorizontal = null;
                    _initializeVideoPlayerFutureHorizontal =
                        _controllerHorizontal.initialize();
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      _controllerHorizontal.setVolume(0);
                      _controllerHorizontal.play();
                      _controllerHorizontal.setLooping(true);
                    });
                  }
                  return FutureBuilder(
                      future: _initializeVideoPlayerFutureHorizontal,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // return AspectRatio(
                          //   aspectRatio:
                          //       _controllerHorizontal.value.aspectRatio,
                          //   child: VideoPlayer(_controllerHorizontal),
                          // );
                          return
                            GifImage(
                              controller: controller,
                              image: AssetImage("assets/video/tower_horizontal.gif"),
                            );
                        } else {
                          return Container();
                        }
                      });
                }),
              ));
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
                      image: AssetImage("assets/images/blur.jpg"),
                      width: MediaQuery.of(context).size.width * 0.065,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: Center(
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text("А\nН\nА\nК\nО\nН",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 100)))),
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
                    "assets/images/blur_horizontal.png",
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
                                  letterSpacing: 40)))))
            ]);
    }

    Widget _buildBackground() {
      return isMouse
          ? Row(
              children: [
                _buildTower(),
                Spacer(),
                _buildBlur(),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                _buildTower(),
                Spacer(),
                _buildBlur(),
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
          MenuWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _mainController.dispose();
    _towerController.dispose();
    _blurController.dispose();
  }
}
