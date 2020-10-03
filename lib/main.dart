import 'dart:developer';

import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/drawer/menu_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/menu_widget.dart';
import 'package:anakonProject/widgets/content/content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

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

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

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
    _controller = VideoPlayerController.asset("assets/video/tower1.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();

    _controllerHorizontal =
        VideoPlayerController.asset("assets/video/tower_horizontal.m4v");
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

    Widget _buildTower() {
      return isMouse
          ? Container(
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
                        return FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                );
                              } else {
                                return Container();
                              }
                            });
                      })),
                ],
              ),
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
                          return AspectRatio(
                            aspectRatio:
                                _controllerHorizontal.value.aspectRatio,
                            child: VideoPlayer(_controllerHorizontal),
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
          ? Container(
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
            )
          : Container(
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
            );
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
                _buildTower(),
                Spacer(),
                _buildBlur(),
              ],
            );
    }

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBarWidget(
                preferredSize: Size.fromHeight(isMouse ? 70 : 40),
              ),
              body: Container(
                margin: isMouse ? null : EdgeInsets.only(bottom: 50),
                child: SingleChildScrollView(
                    physics: isMouse
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    controller: _mainController,
                    child: ContentWidget()),
              )),
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
