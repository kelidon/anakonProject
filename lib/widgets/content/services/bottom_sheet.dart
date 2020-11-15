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

  showBottomSheet(String title, String text, String imageLink) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageLink),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.80),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    expand: false,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Text(title, style: AppStyles.BS_TITLE, textAlign: TextAlign.center),
                              SizedBox(
                                height: 30,
                              ),
                              Text(text, style: AppStyles.BS_REGULAR, textAlign: TextAlign.justify),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
        });
  }
}
