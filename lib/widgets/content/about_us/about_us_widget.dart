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
    return Column(
      children: [
        Container(
          //padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            AppText.TAGLINE_1,
            style: AppStyles.TITLE,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
                    AppText.ABOUT_US_TITLE,
                    style: AppStyles.TITLE,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CollapsingLinesWidget(
                                titleType: CollapsingTitle.CONS_1,
                              ),
                              SizedBox(height: 40,),
                              CollapsingLinesWidget(
                                titleType: CollapsingTitle.CONS_2,
                              ),
                              SizedBox(height: 40,),
                              CollapsingLinesWidget(
                                titleType: CollapsingTitle.CONS_3,
                              ),
                              SizedBox(height: 40,),
                              CollapsingLinesWidget(
                                titleType: CollapsingTitle.CONS_4,
                              ),
                            ],
                          ),
                        ],
                      ),
                      BlocBuilder<CollapsedHeadersConsBloc,
                          MapEntry<CollapsingTitle, CollapsingState>>(
                          builder: (_, state) {
                            return state.value == CollapsingState.COLLAPSED
                                ? FutureBuilder(
                                future: Future.delayed(Duration(milliseconds: 0), () {}),
                                builder: (context, snapshot) {
                                  if(snapshot.connectionState == ConnectionState.done) {
                                    return Center(
                                      child: Container(
                                          margin: EdgeInsets.only(left: 60),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 60),
                                          child: Center(
                                            child: Text(
                                              CollapsingTypeToStateMapper
                                                  .typeToStateMap[state.key].value
                                                  .value,
                                              style: AppStyles.REGULAR,
                                            ),
                                          )),
                                    );
                                  } else return Container();
                                }
                            )
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
