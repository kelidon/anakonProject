import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  showBottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // image:DecorationImage(
                //  image: AssetImage("assets/images/blur.jpg"),
                //    fit:BoxFit.cover,
                // ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
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
                              Text(AppText.ABOUT_US_TITLE,
                                  style: AppStyles.REGULAR_SERVICES),
                              Text(AppText.ABOUT_US_1_CONTENT,
                                  style: AppStyles.REGULAR_SERVICES),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
