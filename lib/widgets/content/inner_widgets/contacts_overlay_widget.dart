import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anakonProject/widgets/content/inner_widgets/collapsing_lines_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsOverlayWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _ContactsOverlayWidgetState();
}


class _ContactsOverlayWidgetState extends State<ContactsOverlayWidget> {


  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
              boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 50,
          offset: Offset(1, 3)),
      ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Image(
                    image: AssetImage("assets/images/logo_menu.png"),
                    width: 250,
                    fit: BoxFit.fitWidth,
                  ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       AppText.CONTACTS_TEXT, style: AppStyles.TITLE
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Text(
                       AppText.CONTACTS_NUMBER, style: AppStyles.TITLE
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Text(
                       AppText.CONTACTS_GMAIL, style: AppStyles.TITLE
                     ),
                     SizedBox(
                       height: 30,
                     ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xFF06285A),
                              size: 70
                          ),
                          Icon(
                            Icons.circle,
                            color: Color(0xFF06285A),
                            size: 70
                          ),
                          Icon(
                            Icons.circle,
                              color: Color(0xFF06285A),
                              size: 70
                          ),
                        ],
                      ),
                   ],
                 ),
                ],
              ),
          ),
        ),
    );
  }
}
