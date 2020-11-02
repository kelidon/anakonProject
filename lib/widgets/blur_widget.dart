import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlurWidget extends StatefulWidget {
  final ScrollController blurController;

  const BlurWidget({Key key, this.blurController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlurWidgetState(blurController);
}

class _BlurWidgetState extends State<BlurWidget> with TickerProviderStateMixin {
  final ScrollController blurController;

  _BlurWidgetState(this.blurController);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        bool isMouse = state == Metrics.BIG;
        return isMouse
            ? Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: blurController,
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
      },
    );
  }
}
