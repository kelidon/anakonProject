import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class ColoredStripeWidget extends StatelessWidget {
  final ScrollController stripeController;

  const ColoredStripeWidget({Key key, this.stripeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: "assets/images/blur.jpg",
                        width: MediaQuery.of(context).size.width * 0.065,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: "assets/images/right_stripe_hover.png",
                        width: MediaQuery.of(context).size.width * 0.065,
                        height: MediaQuery.of(context).size.height * 0.9,
                        fit: BoxFit.contain,
                      )),
                ],
              )
            : Stack(children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: "assets/images/blur_horizontal.png",
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
