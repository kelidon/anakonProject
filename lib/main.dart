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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.setVolume(0);
      _controller.play();
      _controller.setLooping(true);
    });
    super.initState();
  }

  bool isMouse = true;

  @override
  Widget build(BuildContext context) {
    isMouse = MediaQuery.of(context).size.shortestSide > 950;
    context.bloc<MetricsBloc>().add(isMouse ? Metrics.BIG : Metrics.SMALL);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: SingleChildScrollView(
                controller: _towerController,
                child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        return Center(child: Text("anakon logo"));
                      }
                    })),
          ),
          SingleChildScrollView(
            controller: _blurController,
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/blur.jpg"),
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBarWidget(),
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
