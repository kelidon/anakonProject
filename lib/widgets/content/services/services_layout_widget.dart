import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/content/inner_widgets/service_icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contacts_widget.dart';

class ServicesLayoutWidget extends StatelessWidget {
  final List<ServicesPageType> serviceTypes;

  const ServicesLayoutWidget({Key key, this.serviceTypes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsBloc, Metrics>(builder: (_, state) {
      bool isMouse = state == Metrics.BIG;
      return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 10,
                offset: Offset(1, 3)),
          ], // boxShadow
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(AppText.SERVICE_TITLE, style: AppStyles.TITLE),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    isMouse
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ServiceIconWidget(
                                    serviceType: serviceTypes[0],
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  ServiceIconWidget(
                                    serviceType: serviceTypes[1],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ServiceIconWidget(
                                    serviceType: serviceTypes[2],
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  ServiceIconWidget(
                                    serviceType: serviceTypes[3],
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ServiceIconWidget(
                                serviceType: serviceTypes[0],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              ServiceIconWidget(
                                serviceType: serviceTypes[1],
                              ),
                              ServiceIconWidget(
                                serviceType: serviceTypes[2],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              ServiceIconWidget(
                                serviceType: serviceTypes[3],
                              ),
                            ],
                          ),
                    Spacer(),
                    ContactsWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
