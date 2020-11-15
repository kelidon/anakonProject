import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/fonts_icons/anakon_greek_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
              bool isMouse = state != Metrics.SMALL;
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
                                    style:  state == Metrics.BIG? AppStyles.TITLE:AppStyles.TITLE_M),
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text:
                                  new TextSpan(
                                      text: AppText.CONTACTS_NUMBER,
                                      recognizer: new TapGestureRecognizer()..onTap = () async {
                                          final Uri _telLaunchUri = Uri(
                                              scheme: 'tel',
                                              path: '+375-44-570-57-57',
                                              queryParameters: {
                                                'subject': 'Example Subject & Symbols are allowed!'
                                              }
                                          );

                                          if (await canLaunch(_telLaunchUri.toString())) {
                                            await launch(_telLaunchUri.toString());
                                          } else {
                                            throw 'Could not launch $_telLaunchUri';
                                          }
                                      },
                                      style:  state == Metrics.BIG? AppStyles.TITLE:AppStyles.TITLE_M),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text:
                                  new TextSpan(
                                      text: AppText.CONTACTS_GMAIL,
                                      recognizer: new TapGestureRecognizer()..onTap = () async {
                                        final Uri _emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: 'smith@example.com',
                                            queryParameters: {
                                              'subject': 'Example Subject & Symbols are allowed!'
                                            }
                                        );

                                        if (await canLaunch(_emailLaunchUri.toString())) {
                                        await launch(_emailLaunchUri.toString());
                                        } else {
                                        throw 'Could not launch $_emailLaunchUri';
                                        }
                                      },
                                      style:  state == Metrics.BIG? AppStyles.TITLE:AppStyles.TITLE_M),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                    iconSize: 40,
                                      icon: Icon(AnakonGreek.telegram),
                                      color: Color(0xFF06285A),
                                      onPressed: () async {
                                        const _tgLaunchUri = 'https://t.me/Appolon_13';

                                        if (await canLaunch(_tgLaunchUri.toString())) {
                                          await launch(_tgLaunchUri.toString());
                                        } else {
                                          throw 'Could not launch $_tgLaunchUri';
                                        }
                                      } ,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      // child: IconButton(
                                      //   icon:Icon(AnakonGreek.viber),
                                      //   iconSize: 40,
                                      //   color: Color(0xFF06285A),
                                      //   onPressed: () async {
                                      //     const _viberLaunchUri = 'https://viber://chat?number=79119998877';
                                      //
                                      //     if (await canLaunch(_viberLaunchUri.toString())) {
                                      // await launch(_viberLaunchUri.toString());
                                      // } else {
                                      // throw 'Could not launch $_viberLaunchUri';
                                      // }
                                      // }
                                      // ),
                                    ),
                                    IconButton(
                                      iconSize: 40,
                                      icon: Icon(AnakonGreek.wattsapp),
                                      color: Color(0xFF06285A),
                                        onPressed: () async {
                                          const _waLaunchUri = 'https://wa.me/375445705757';

                                          if (await canLaunch(_waLaunchUri.toString())) {
                                            await launch(_waLaunchUri.toString());
                                          } else {
                                            throw 'Could not launch $_waLaunchUri';
                                          }
                                        } ,
                                    ),
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
