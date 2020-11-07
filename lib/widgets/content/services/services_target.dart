import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesTargetWidget extends StatelessWidget {
  final BuildContext mainContext;
  final ServicesPageType tag;

  const ServicesTargetWidget({Key key, this.tag, this.mainContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          Navigator.pop(mainContext);
        },
        child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: 30),
              color: Colors.white,
            child: Row(
              children: [
                Hero(
                  tag: tag,
                  child: Container(
                      padding:
                      EdgeInsets.only(right: 30),
                      width: MediaQuery.of(context)
                          .size
                          .width /
                          7,
                      child: Text(
                        ServicesTypeToStateMapper
                            .typeToStateMap[tag]
                            .key,
                        style: AppStyles.TITLE,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 20),
                  height: MediaQuery.of(context)
                      .size
                      .height,
                  width: 2,
                  color: AppColors.PRIMARY,
                ),
                Flexible(
                  child: Container(
                      padding:
                      EdgeInsets.only(left: 30),
                      child: Text(
                        ServicesTypeToStateMapper
                            .typeToStateMap[tag]
                            .value,
                        style: AppStyles.REGULAR_SERVICES,
                        textAlign: TextAlign.justify,
                      )),
                )
              ],
            )),
      ),
    );
  }

}
