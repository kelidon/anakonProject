import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/content/inner_widgets/collapsing_lines_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppText.TAGLINE_3,
              style: AppStyles.TITLE,
              maxLines: 1,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 10,
                    offset: Offset(1, 3)),
              ], // boxShadow
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CollapsingLinesWidget(
                              titleType: CollapsingTitle.HOW_WORK_1,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CollapsingLinesWidget(
                              titleType: CollapsingTitle.HOW_WORK_2,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CollapsingLinesWidget(
                              titleType: CollapsingTitle.HOW_WORK_3,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<CollapsedHeadersHowWorkBloc,
                              MapEntry<CollapsingTitle, CollapsingState>>(
                          builder: (_, state) {
                        return state.value == CollapsingState.COLLAPSED
                            ? FutureBuilder(
                                future: Future.delayed(
                                    Duration(milliseconds: 0), () {}),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Center(
                                      child: Container(
                                          margin: EdgeInsets.only(left: 60),
                                          padding: EdgeInsets.only(
                                              left: 40, right: 10),
                                          child: Center(
                                            child: Text(
                                              CollapsingTypeToStateMapper
                                                  .typeToStateMap[state.key]
                                                  .value
                                                  .value,
                                              style: AppStyles.REGULAR_SERVICES,
                                            ),
                                          )),
                                    );
                                  } else
                                    return Container();
                                })
                            : Container();
                      })
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
