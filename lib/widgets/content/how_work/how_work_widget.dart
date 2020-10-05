import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HowWorkWidget extends StatefulWidget {
  final double height;

  const HowWorkWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HowWorkWidgetState(height);
}


class _HowWorkWidgetState extends State<HowWorkWidget> {
  final double height;

  _HowWorkWidgetState(this.height);


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),

          //color: Colors.grey.withOpacity(0.4),
        ),
        height: height,
        margin: EdgeInsets.only(top: 20, bottom: 20),



        child: Container(
          //padding: EdgeInsets.symmetric(horizontal:40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  AppText.HOW_WORK_TITLE, style: AppStyles.TITLE,
                ),
              ),
              Text(
                  AppText.N
              ),
              Text(
                AppText.SLOGAN1, style: AppStyles.REGULAR,
              ),
              Text(
                AppText.SLOGAN2, style: AppStyles.REGULAR,
              ),
              Text(
                  AppText.N
              ),
              Center(
                child: Text(
                  AppText.SLOGAN3, style: AppStyles.TITLE,
                ),
              ),
              Text(
                  AppText.N
              ),
              Text(
                AppText.SLOGAN3_1, style: AppStyles.REGULAR,
              ),
              Text(
                AppText.SLOGAN3_2, style: AppStyles.REGULAR,
              ),
              Text(
                AppText.SLOGAN3_3, style: AppStyles.REGULAR,
              ),
              Text(
                AppText.SLOGAN3_4, style: AppStyles.REGULAR,
              ),
            ],
          ),
        )
    );

  }
}
