import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 17),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () => context.bloc<ContactsOverlayBloc>().add(true),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.PRIMARY,
                    ),
                    child: Center(
                        child: Text(
                      AppText.CONTACT_LABEL,
                      style: AppStyles.CONTACT_BUTTON,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
