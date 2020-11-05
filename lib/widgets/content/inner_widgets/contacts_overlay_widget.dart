import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/fonts_icons/anakon_greek_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsOverlayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactsOverlayWidgetState();
}

class _ContactsOverlayWidgetState extends State<ContactsOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsOverlayBloc, bool>(
        builder: (_, isOverlayVisible) {
      return Visibility(
          visible: isOverlayVisible,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black.withOpacity(0.3),
            child: InkWell(onTap: () {
              context.bloc<ContactsOverlayBloc>().add(false);
            }, child: BlocBuilder<MetricsBloc, Metrics>(builder: (_, state) {
              bool isMouse = state == Metrics.BIG;
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        isMouse ? MediaQuery.of(context).size.width * 0.3 : 50),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(1, 3)),
                          ]),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/logo_menu.png"),
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppText.CONTACTS_TEXT,
                                    style: AppStyles.TITLE),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(AppText.CONTACTS_NUMBER,
                                    style: AppStyles.TITLE),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(AppText.CONTACTS_GMAIL,
                                    style: AppStyles.TITLE),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(AnakonGreek.telegram,
                                        color: Color(0xFF06285A), size: 40),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 50),
                                      child: Icon(AnakonGreek.viber,
                                          color: Color(0xFF06285A), size: 40),
                                    ),
                                    Icon(AnakonGreek.wattsapp,
                                        color: Color(0xFF06285A), size: 40),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
          ));
    });
  }
}
