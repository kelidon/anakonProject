import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:video_player/video_player.dart';

class TowerWidget extends StatefulWidget {
  final ScrollController towerController;

  const TowerWidget({Key key, this.towerController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TowerWidgetState(towerController);
}

class _TowerWidgetState extends State<TowerWidget>
    with TickerProviderStateMixin {
  final ScrollController towerController;

  VideoPlayerController _towerVideoController;
  Future<void> _initializeVideoPlayerFuture;

  GifController _towerGifController;

  _TowerWidgetState(this.towerController);

  @override
  void initState() {
    super.initState();
    _towerVideoController =
        VideoPlayerController.asset("assets/video/tower.mp4");
    _initializeVideoPlayerFuture = _towerVideoController.initialize();

    _towerGifController = GifController(vsync: this);
    _towerGifController.animateTo(0.5, duration: Duration(milliseconds: 1000));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _towerVideoController.setVolume(0);
      _towerVideoController.play();
      _towerVideoController.setLooping(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _towerVideoController.dispose();
    _towerGifController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/images/logo_on_tower_2.png';
    final Widget logoOnTower = Image.asset(
      assetName,
    );
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        bool isMouse = state == Metrics.BIG;
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
                            controller: towerController,
                            child: BlocBuilder<MetricsBloc, Metrics>(
                                builder: (context, state) {
                              if (state == Metrics.BIG) {
                                _initializeVideoPlayerFuture = null;
                                _initializeVideoPlayerFuture =
                                    _towerVideoController.initialize();
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  _towerVideoController.setVolume(0);
                                  _towerVideoController.play();
                                  _towerVideoController.setLooping(true);
                                });
                              }
                              return Container(
                                child: FutureBuilder(
                                    future: _initializeVideoPlayerFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return AspectRatio(
                                          aspectRatio: _towerVideoController
                                              .value.aspectRatio,
                                          child: VideoPlayer(
                                              _towerVideoController),
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
                    child: GifImage(
                      controller: _towerGifController,
                      image: AssetImage("assets/video/tower_horizontal.gif"),
                    )));
      },
    );
  }
}
