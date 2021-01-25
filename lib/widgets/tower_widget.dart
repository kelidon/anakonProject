import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/image_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  VideoPlayerController _mobileVideoController;

  @override
  void initState() {
    super.initState();
    _desktopVideoController = VideoPlayerController.asset("video/tower.mp4");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _desktopVideoController.setVolume(0);
      _desktopVideoController.play();
      _desktopVideoController.setLooping(true);
    });

    //todo
    _mobileVideoController =
        VideoPlayerController.asset("video/tower_mobile.mp4");

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        return state != Metrics.SMALL
            ? Container(
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
                            future: _desktopVideoController.initialize(),
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
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Container(child: ImageUtils.towerLogo),
                      ),
                    ],
                  )
                ],
              ),
            )
            : Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    child: FutureBuilder(
                        future: _mobileVideoController.initialize(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            //todo
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
                  )),
            ],
          ),
        );
      },
    );
  }
}
