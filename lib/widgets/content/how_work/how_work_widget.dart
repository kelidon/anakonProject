import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anakonProject/widgets/content/inner_widgets/collapsing_lines_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 10,
                offset: Offset(1, 3)
            ),
          ],// boxShadow
        ),
        height: height,
        child: Column(
          children: [
            Center(
              child: Text(
                AppText.HOW_WORK_TITLE,
                style: AppStyles.TITLE,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CollapsingLinesWidget(
                        titleType: CollapsingTitle.HOW_WORK_1,
                      ),
                      CollapsingLinesWidget(
                        titleType: CollapsingTitle.HOW_WORK_2,
                      ),
                      CollapsingLinesWidget(
                        titleType: CollapsingTitle.HOW_WORK_3,
                      ),
                    ],
                  ),
                  BlocBuilder<CollapsedHeadersHowWorkBloc,
                      MapEntry<CollapsingTitle, CollapsingState>>(builder: (_, state) {
                    return
                      state.value==CollapsingState.COLLAPSED?Center(
                      child: Container(margin: EdgeInsets.only(left: 60), color: Colors.yellow, height: 60.0*3 - 10,padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                                CollapsingTypeToStateMapper.typeToStateMap[state.key].value.value),
                          )),
                    ):
                      Container();
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
