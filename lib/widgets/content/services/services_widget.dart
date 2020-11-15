import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/contacts_overlay/contacts_overlay_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/colors.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/widgets/content/inner_widgets/service_icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {

  HeroController _heroController1;
  HeroController _heroController2;

  @override
  void initState() {
    super.initState();
    _heroController1 = HeroController(createRectTween: _createRectTween);
    _heroController2 = HeroController(createRectTween: _createRectTween);
  }

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Widget _buildContact() {
      return  BlocBuilder<MetricsBloc, Metrics>(
          builder: (_, state) {
            bool isMouse = state == Metrics.BIG;
          return Container(
            margin: EdgeInsets.only(bottom: 17),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () => context.bloc<ContactsOverlayBloc>().add(true),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              blurRadius: 7,
                              offset: Offset(1, 3)),
                        ], // boxShadow
                      ),
                      child: Center(
                          child: Text(
                        AppText.CONTACT_LABEL,
                        style: isMouse? AppStyles.CONTACT_BUTTON:AppStyles.CONTACT_BUTTON_M,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      );
    }

    _buildServicesLayout(serviceTypes, heroController){
      return BlocBuilder<MetricsBloc, Metrics>(
        builder: (_, state) {
          bool isMouse = state != Metrics.SMALL;
          return Container(
            margin: EdgeInsets.all(isMouse?15:8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 5,
                    offset: Offset(1, 3)),
              ], // boxShadow
            ),
            child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(AppText.SERVICE_TITLE, style: state == Metrics.BIG?AppStyles.TITLE:AppStyles.TITLE_M),
                              Expanded(
                                child: Navigator(
                                  observers: [heroController],
                                  onGenerateRoute: (settings){
                                    return MaterialPageRoute(
                                      builder: (_) => BlocBuilder<MetricsBloc, Metrics>(
                                        builder: (_, state) {
                                          bool isMouse = state != Metrics.SMALL;
                                          return Column(
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
                                                        mainContext: _,
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                      ),
                                                      ServiceIconWidget(
                                                        serviceType: serviceTypes[1],
                                                        mainContext: _,
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
                                                        mainContext: _,
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                      ),
                                                      ServiceIconWidget(
                                                        serviceType: serviceTypes[3],
                                                        mainContext: _,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ):
                                              Column(
                                                children: [
                                                  ServiceIconWidget(
                                                    serviceType: serviceTypes[0],
                                                    mainContext: _,
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  ServiceIconWidget(
                                                    serviceType: serviceTypes[1],
                                                    mainContext: _,
                                                  ),
                                                  ServiceIconWidget(
                                                    serviceType: serviceTypes[2],
                                                    mainContext: _,
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  ServiceIconWidget(
                                                    serviceType: serviceTypes[3],
                                                    mainContext: _,
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              _buildContact(),
                                            ],
                                          );
                                        }
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),));


        }
      );
    }

    List<Widget> _buildBottom(List list) {
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

    final list = [
      _buildServicesLayout([ServicesPageType.FIRST_PAGE_1,ServicesPageType.FIRST_PAGE_2,ServicesPageType.FIRST_PAGE_3,ServicesPageType.FIRST_PAGE_4,], _heroController1),
      _buildServicesLayout([ServicesPageType.SECOND_PAGE_1,ServicesPageType.SECOND_PAGE_2,ServicesPageType.SECOND_PAGE_3,ServicesPageType.SECOND_PAGE_4], _heroController2),
    ];

    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return BlocBuilder<ServicesItemsBloc,
          MapEntry<ServicesPageType, CollapsingState>>(builder: (_, state) {
        return Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  AppText.TAGLINE_2,
                  style:  isMouse? AppStyles.TITLE:AppStyles.TITLE_M,
                  maxLines: 1,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height > 670? MediaQuery.of(context).size.height - 190:480,
                        scrollPhysics: NeverScrollableScrollPhysics(),
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
                          return i;
                        },
                      );
                    }).toList(),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildBottom(list))
              ],
            ),
          ],
        );
      });
    });
  }
}
