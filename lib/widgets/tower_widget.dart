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

  VideoPlayerController _mobileVideoController;
  Future<void> _initializeMobileVideoPlayerFuture;

  //GifController _mobileGifController;

  @override
  void initState() {
    super.initState();
    _desktopVideoController =
        VideoPlayerController.asset("video/tower.mp4");
    _initializeVideoPlayerFuture = _desktopVideoController.initialize();

    //_mobileGifController = GifController(vsync: this);
    //_mobileGifController.animateTo(0.5, duration: Duration(milliseconds: 1000));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _desktopVideoController.setVolume(0);
      _desktopVideoController.play();
      _desktopVideoController.setLooping(true);
    });

  _mobileVideoController =
      VideoPlayerController.asset("video/tower_horizontal.mp4");
  _initializeMobileVideoPlayerFuture = _mobileVideoController.initialize();

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    _mobileVideoController.setVolume(0);
    _mobileVideoController.play();
    _mobileVideoController.setLooping(true);
  });
  }

  @override
  void dispose() {
    super.dispose();
    _desktopVideoController.dispose();
    _desktopVideoController.dispose();
    //_mobileGifController.dispose();
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
                      child: Container(
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
                            )
                          ),
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
                child: Container(
                  child: FutureBuilder(
                      future: _initializeMobileVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _mobileVideoController
                                .value.aspectRatio,
                            child: VideoPlayer(
                                _mobileVideoController),
                          );
                        } else {
                          return Container();
                        }
                      }),
                )
            ));
      },
    );
  }
}
