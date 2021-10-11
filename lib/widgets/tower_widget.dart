import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/image_utils.dart';
import 'package:anakonProject/widgets/tower_widget/horizontal/horizontal_tower_widget.dart';
import 'package:anakonProject/widgets/tower_widget/vertical/vertical_tower_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TowerWidget extends StatefulWidget {
  final ScrollController towerController;

  const TowerWidget({Key key, this.towerController}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TowerWidgetState();
}

class _TowerWidgetState extends State<TowerWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height,
                          child: VerticalTowerWidget(),
                        )),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Container(child: ImageUtils.towerLogo),
                    )
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 1),
                width: MediaQuery.of(context).size.width,
                height: 38,
                child: HorizontalTowerWidget(),
              );
      },
    );
  }
}
