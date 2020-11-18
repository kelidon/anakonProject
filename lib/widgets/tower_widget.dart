import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/image_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:video_player/video_player.dart';

class TowerWidget extends StatefulWidget {
  final ScrollController towerController;

  const TowerWidget({Key key, this.towerController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TowerWidgetState();
}

class _TowerWidgetState extends State<TowerWidget>
    with TickerProviderStateMixin {
  VideoPlayerController _desktopVideoController;
  Future<void> _initializeVideoPlayerFuture;

  GifController _mobileGifController;

  @override
  void initState() {
    super.initState();
    _desktopVideoController =
        VideoPlayerController.asset("../web/tower.mp4");
    _initializeVideoPlayerFuture = _desktopVideoController.initialize();

    _mobileGifController = GifController(vsync: this);
    _mobileGifController.animateTo(0.5, duration: Duration(milliseconds: 1000));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _desktopVideoController.setVolume(0);
      _desktopVideoController.play();
      _desktopVideoController.setLooping(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _desktopVideoController.dispose();
    _mobileGifController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        return state != Metrics.SMALL
            ? Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: widget.towerController,
                            child: BlocBuilder<MetricsBloc, Metrics>(
                                builder: (context, state) {
                              if (state != Metrics.SMALL) {
                                _initializeVideoPlayerFuture = null;
                                _initializeVideoPlayerFuture =
                                    _desktopVideoController.initialize();
                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  _desktopVideoController.setVolume(0);
                                  _desktopVideoController.play();
                                  _desktopVideoController.setLooping(true);
                                });
                              }
                              return Container(
                                child: FutureBuilder(
                                    future: _initializeVideoPlayerFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return AspectRatio(
                                          aspectRatio: _desktopVideoController
                                              .value.aspectRatio,
                                          child: VideoPlayer(
                                              _desktopVideoController),
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
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Container(child: ImageUtils.towerLogo),
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
                    controller: _mobileGifController,
                    image: ImageUtils.mobileGif,
                  ),
                ));
      },
    );
  }
}
