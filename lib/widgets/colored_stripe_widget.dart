import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColoredStripeWidget extends StatelessWidget {
  final ScrollController stripeController;

  const ColoredStripeWidget({Key key, this.stripeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pictures = ["images/blur.jpg"];

    var picturesMobile = ["images/blur_horizontal.png"];

    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        bool isMobile = state == Metrics.SMALL;
        return !isMobile
            ? Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: stripeController,
                      child: Image(
                        image: AssetImage(pictures[0]),
                        width: MediaQuery.of(context).size.width * 0.065,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.065,
                    child: Center(
                        child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Column(
                        children: [
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("А",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("Н",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("А",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("К",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("О",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                          FittedBox(
                              fit: BoxFit.contain,
                              child: Text("Н",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 100))),
                        ],
                      ),
                    )),
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
                      picturesMobile[0],
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
                                    letterSpacing: 40))))),
              ]);
      },
    );
  }
}
