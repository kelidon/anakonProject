import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/widgets/content/inner_widgets/service_icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesWidget extends StatefulWidget {
  final double height;

  const ServicesWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServicesWidgetState(height);
}

class _ServicesWidgetState extends State<ServicesWidget> {
  final double height;

  _ServicesWidgetState(this.height);

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Widget _buildContact() {
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

    _buildServicesLayout(serviceTypes){
      return BlocBuilder<MetricsBloc, Metrics>(
        builder: (_, state) {
          bool isMouse = state == Metrics.BIG;
          return Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(top: 15),
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
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(AppText.SERVICE_TITLE, style: AppStyles.TITLE),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        isMouse?Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ServiceIconWidget(
                                  serviceType: serviceTypes[0],
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                ServiceIconWidget(
                                  serviceType: serviceTypes[1],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ServiceIconWidget(
                                  serviceType: serviceTypes[2],
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                ServiceIconWidget(
                                  serviceType: serviceTypes[3],
                                ),
                              ],
                            ),
                          ],
                        ):Column(
                          children: [
                            ServiceIconWidget(
                              serviceType: serviceTypes[0],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ServiceIconWidget(
                              serviceType: serviceTypes[1],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            ServiceIconWidget(
                              serviceType: serviceTypes[2],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ServiceIconWidget(
                              serviceType: serviceTypes[3],
                            ),
                          ],
                        ),
                        Spacer(),
                        _buildContact(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      );
    }
    var list = [
      _buildServicesLayout([ServicesPageType.FIRST_PAGE_1,ServicesPageType.FIRST_PAGE_2,ServicesPageType.FIRST_PAGE_3,ServicesPageType.FIRST_PAGE_4,]),
      _buildServicesLayout([ServicesPageType.SECOND_PAGE_1,ServicesPageType.SECOND_PAGE_2,ServicesPageType.SECOND_PAGE_3,ServicesPageType.SECOND_PAGE_4]),
    ];

    List<Widget> _buildBottom() {
      List<Widget> listWidgets = [];
      listWidgets.add(Container(
        margin: EdgeInsets.only(right: 20),
        child: IconButton(
          padding: EdgeInsets.all(0),
          iconSize: 50,
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            context.bloc<ServicesItemsBloc>().add(CollapseServiceEvent(
                context.bloc<ServicesItemsBloc>().state.key));
            _controller.previousPage(
                duration: Duration(milliseconds: 800), curve: Curves.easeOut);
          },
        ),
      ));
      listWidgets.addAll(list.map((e) {
        int index = list.indexOf(e);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? Color(0xFF06285A)
                : Color(0xFF06285A).withOpacity(0.4),
          ),
        );
      }).toList());
      listWidgets.add(Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
            padding: EdgeInsets.all(0),
            iconSize: 50,
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              context.bloc<ServicesItemsBloc>().add(CollapseServiceEvent(
                  context.bloc<ServicesItemsBloc>().state.key));
              _controller.nextPage(
                  duration: Duration(milliseconds: 800), curve: Curves.easeOut);
            },
          )));
      return listWidgets;
    }

    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<ServicesItemsBloc,
          MapEntry<ServicesPageType, CollapsingState>>(builder: (_, state) {
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
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          height: height,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: list.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                i,
                                AnimatedOpacity(
                                  opacity: state.value == CollapsingState.EXPANDED?1:0,
                                  duration: Duration(milliseconds: 200),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Visibility(
                                      visible:
                                          state.value == CollapsingState.EXPANDED,
                                      maintainState: true,
                                      maintainAnimation: true,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          context.bloc<ServicesItemsBloc>().add(
                                              CollapseServiceEvent(context
                                                  .bloc<ServicesItemsBloc>()
                                                  .state
                                                  .key));
                                        },
                                        child: Container(
                                            height:
                                            height-110,
                                            margin: EdgeInsets.all(15),
                                            padding:
                                                EdgeInsets.symmetric(horizontal: 30),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        Colors.grey.withOpacity(0.6),
                                                    blurRadius: 10,
                                                    offset: Offset(1, 3)),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.only(right: 30),
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        7,
                                                    child: Text(
                                                      ServicesTypeToStateMapper
                                                          .typeToStateMap[state.key]
                                                          .key,
                                                      style: AppStyles.TITLE,
                                                      textAlign: TextAlign.center,
                                                    )),
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
                                                            .typeToStateMap[state.key]
                                                            .value,
                                                        style: AppStyles.REGULAR_SERVICES,
                                                        textAlign: TextAlign.justify,
                                                      )),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildBottom())
                ],
              ),
            ),
          ],
        );
      });
    });
  }
}
