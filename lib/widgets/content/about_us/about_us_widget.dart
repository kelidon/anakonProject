import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/content/inner_widgets/collapsing_lines_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          children: [
            Center(
              child: Text(
                AppText.ABOUT_US_TITLE,
                style: AppStyles.TITLE,
              ),
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CollapsingLinesWidget(
                      titleType: CollapsingTitle.CONS_1,
                    ),
                    CollapsingLinesWidget(
                      titleType: CollapsingTitle.CONS_2,
                    ),
                    CollapsingLinesWidget(
                      titleType: CollapsingTitle.CONS_3,
                    ),
                    CollapsingLinesWidget(
                      titleType: CollapsingTitle.CONS_4,
                    ),
                  ],
                ),
                BlocBuilder<CollapsedHeadersConsBloc,
                    MapEntry<CollapsingTitle, CollapsingState>>(builder: (_, state) {
                  return state.value==CollapsingState.COLLAPSED?Center(
                    child: Container(margin: EdgeInsets.only(left: 60), color: Colors.yellow, height: 60.0*3 - 10,padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                              CollapsingTypeToStateMapper.typeToStateMap[state.key].value.value),
                        )),
                  ):Container();
                })
              ],
            ),
          ],
        ));
  }
}
