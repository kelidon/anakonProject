import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetWidget {
  static final BottomSheetWidget _instance = BottomSheetWidget._internal();
  BuildContext context;

  setContext(BuildContext context) {
    this.context = context;
  }

  factory BottomSheetWidget() {
    return _instance;
  }

  BottomSheetWidget._internal();

  showBottomSheet(String title, String text,  String imageLink){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BlocBuilder<MetricsBloc, Metrics>(
              builder: (_, state) {
                bool isMouse = state == Metrics.BIG;
              return Container(
                color: Color(0xFF737373),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        // image:DecorationImage(
                        // fit:BoxFit.cover,
                        //  image: AssetImage("assets/images/blur.jpg"),
                        //    (20),
                        topRight: Radius.circular(20)),
                  ),
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      expand: false,
                      builder: (context, scrollController) {
                        return Container(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(title,
                                      style: isMouse? AppStyles.REGULAR_SERVICES:AppStyles.REGULAR_SERVICES_M),
                                  Text(text,
                                      style: isMouse? AppStyles.REGULAR_SERVICES:AppStyles.REGULAR_SERVICES_M),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            }
          );
        });
  }
}
