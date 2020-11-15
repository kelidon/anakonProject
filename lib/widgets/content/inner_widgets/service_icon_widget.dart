import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/content/services/bottom_sheet.dart';
import 'package:anakonProject/widgets/content/services/services_target.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_page_route.dart';

class ServiceIconWidget extends StatefulWidget {
  final BuildContext mainContext;
  final ServicesPageType serviceType;

  const ServiceIconWidget({Key key, this.serviceType, this.mainContext})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServiceIconWidgetState();
}

class _ServiceIconWidgetState extends State<ServiceIconWidget> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_, state) {
        bool isMouse = state != Metrics.SMALL;
        return BlocBuilder<ServicesItemsBloc,
            MapEntry<ServicesPageType, CollapsingState>>(builder: (_, state) {
          return InkWell(
            onTap: () {
              if (isMouse) {
                Navigator.push(
                    widget.mainContext,
                    CustomPageRoute(ServicesTargetWidget(
                        tag: widget.serviceType,
                        mainContext: widget.mainContext)));
              } else {
                BottomSheetWidget().showBottomSheet(
                  ServicesTypeToStateMapper
                    .typeToStateMap[widget.serviceType]
                    .key,
                  ServicesTypeToStateMapper
                      .typeToStateMap[widget.serviceType]
                  .value,
                    "assets/images/new_blur_3.jpg");
              }
            },
            child: BlocBuilder<MetricsBloc, Metrics>(builder: (_, state) {
              bool isMouse = state != Metrics.SMALL;
              return Container(
                width: isMouse ? MediaQuery.of(context).size.width * 0.2 : null,
                height:
                    isMouse ? MediaQuery.of(context).size.height>670?MediaQuery.of(context).size.height * 0.18:120 : 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(1, 3)),
                  ], // boxShadow
                ),
                child: Center(
                  child: Text(
                    ServicesTypeToStateMapper
                        .typeToStateMapMobile[widget.serviceType].key,
                    style: state == Metrics.BIG? AppStyles.TITLE:AppStyles.TITLE_M,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),
          );
        });
      },
    );
  }
}
