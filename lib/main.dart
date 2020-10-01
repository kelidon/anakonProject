import 'dart:developer';

import 'package:anakonProject/bloc/drawer/drawer_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/widgets/app_bar/app_bar_widget.dart';
import 'package:anakonProject/widgets/app_bar/drawer_widget.dart';
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
    _towerController.jumpTo(_mainController.offset * 0.1);
    _blurController.jumpTo(_mainController.offset * 0.03);
  }

  @override
  void initState() {
    _mainController = ScrollController();
    _mainController.addListener(_mainScrollListener);
    _towerController = ScrollController();
    _blurController = ScrollController();
    _controller = VideoPlayerController.asset("assets/video/tower.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();

    _controllerHorizontal = VideoPlayerController.asset("assets/video/tower.mp4");
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

    Widget _buildTower(){
      return isMouse?Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Stack(
          children: [
            SingleChildScrollView(
                controller: _towerController,
                child: BlocBuilder<MetricsBloc, Metrics>(
                  builder: (context, state) {
                    if(state == Metrics.BIG){
                      _initializeVideoPlayerFuture = null;
                        _initializeVideoPlayerFuture = _controller.initialize();
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                          _controller.setVolume(0);
                          _controller.play();
                          _controller.setLooping(true);
                      });
                    }
                    return FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width*0.2,
                  color: Colors.white,
                  child: FittedBox(fit:BoxFit.contain,child: Text("ANAKON", style: TextStyle( color: Color(0xFF0B277A)),)),
                ),
              ],
            )
          ],
        ),
      ):Container(
        margin: EdgeInsets.only(top:40),
        alignment: Alignment.topLeft,
        height: 30,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child:
          BlocBuilder<MetricsBloc, Metrics>(
            builder: (context, state) {
              if(state == Metrics.SMALL){
                _initializeVideoPlayerFutureHorizontal = null;
                _initializeVideoPlayerFutureHorizontal = _controllerHorizontal.initialize();
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  _controllerHorizontal.setVolume(0);
                  _controllerHorizontal.play();
                  _controllerHorizontal.setLooping(true);
                });
              }
              return
                FutureBuilder(
                  future: _initializeVideoPlayerFutureHorizontal,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controllerHorizontal.value.aspectRatio,
                        child: VideoPlayer(_controllerHorizontal),
                      );
                    } else {
                      return Container();
                    }
                  });
            }
          ),
        )
      );
    }

    Widget _buildBlur(){
      return isMouse?Container(
        alignment: Alignment.topRight,
        width: MediaQuery.of(context).size.width * 0.1,
        child: SingleChildScrollView(
          controller: _blurController,
          child: Image.asset("assets/images/blur.jpg"),
        ),
      ):Container(
        alignment: Alignment.bottomLeft,
        height: 30,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Image.asset("assets/images/blur.jpg"),
        ),
      );
    }

    Widget _buildBackground(){
      return isMouse?Row(
        children: [
          _buildTower(),
          Spacer(),
          _buildBlur(),
        ],
      ):Column(
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
              appBar: AppBarWidget(preferredSize: Size.fromHeight(isMouse?70:40),),
              drawer: DrawerWidget(),
              body: SingleChildScrollView(
                  physics: isMouse
                      ? NeverScrollableScrollPhysics()
                      : BouncingScrollPhysics(),
                  controller: _mainController,
                  child: ContentWidget())),
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
