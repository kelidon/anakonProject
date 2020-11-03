import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/collapsing_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/hero_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AboutUsWidget extends StatefulWidget {
  final double height;

  const AboutUsWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutUsWidgetState(height);
}

var aboutNavigatorKey = GlobalKey<NavigatorState>();

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final double height;

  _AboutUsWidgetState(this.height);

  HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
  }

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppText.TAGLINE_1,
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
                  child: Navigator(
                    observers: [_heroController],
                    key: aboutNavigatorKey,
                    onGenerateRoute: (settings){
                        return MaterialPageRoute(
                          builder: (_) => Container(alignment:Alignment.center,child: HeroTableWidget(aboutNavKey: aboutNavigatorKey, mainContext: _,))
                        );
                    },
                  )
                  //HeroTableWidget()
                  //WrapExample()

                  // Stack(
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         CollapsingLinesWidget(
                  //           titleType: CollapsingTitle.CONS_1,
                  //         ),
                  //         SizedBox(height: 40,),
                  //         CollapsingLinesWidget(
                  //           titleType: CollapsingTitle.CONS_2,
                  //         ),
                  //         SizedBox(height: 40,),
                  //         CollapsingLinesWidget(
                  //           titleType: CollapsingTitle.CONS_3,
                  //         ),
                  //         SizedBox(height: 40,),
                  //         CollapsingLinesWidget(
                  //           titleType: CollapsingTitle.CONS_4,
                  //         ),
                  //       ],
                  //     ),
                  //     BlocBuilder<CollapsedHeadersConsBloc,
                  //         MapEntry<CollapsingTitle, CollapsingState>>(
                  //         builder: (_, state) {
                  //           return state.value == CollapsingState.COLLAPSED
                  //               ? FutureBuilder(
                  //               future: Future.delayed(Duration(milliseconds: 0), () {}),
                  //               builder: (context, snapshot) {
                  //                 if(snapshot.connectionState == ConnectionState.done) {
                  //                   return Center(
                  //                     child: Container(
                  //                         margin: EdgeInsets.only(left: 60),
                  //                         padding: EdgeInsets.only(left: 40, right: 10),
                  //                         child: Center(
                  //                           child: Text(
                  //                             CollapsingTypeToStateMapper
                  //                                 .typeToStateMap[state.key].value
                  //                                 .value,
                  //                             style: AppStyles.REGULAR_SERVICES,
                  //                           ),
                  //                         )),
                  //                   );
                  //                 } else return Container();
                  //               }
                  //           )
                  //               : Container();
                  //         })
                  //   ],
                  // ),
                ),
              ],
            )),
      ],
    );
  }
}
