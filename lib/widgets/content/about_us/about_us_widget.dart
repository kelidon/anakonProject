import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatefulWidget {
  final double height;

  const AboutUsWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutUsWidgetState(height);
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final double height;

  _AboutUsWidgetState(this.height);


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: height,
        margin: EdgeInsets.only(top: 20, bottom: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                AppText.ABOUT_US_TITLE, style: AppStyles.TITLE,
              ),
            ),
            Text(
                AppText.N
            ),
             Center(
               child: Text(
                AppText.ABOUT_US, style: AppStyles.REGULAR,
            ),
             ),
            Text(
              AppText.N
            ),
            Text(
              AppText.MISSION, style: AppStyles.REGULAR,
            ),
          ],
        )
    );

  }
}
