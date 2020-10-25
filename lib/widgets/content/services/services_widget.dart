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
  bool condition = false;
  final CarouselController _controller = CarouselController();

  _buildService(String title, String text) {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
        child: Container(
          color: Colors.white.withOpacity(0.9),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              Text(title, style: AppStyles.TITLE),
              BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
                bool isMouse = state == Metrics.BIG;
                return Expanded(
                  child: Center(child: Text(text, style: AppStyles.REGULAR)),
                );
              })
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    Widget _buildContact() {
      return Container(
        margin: EdgeInsets.only(bottom: 17),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {},
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
      );
    }

    var list = [
      Container(
        margin: EdgeInsets.all(15),
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
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(AppText.SERVICE1_TITLE, style: AppStyles.TITLE),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ServiceIconWidget(
                                icon: Icons.opacity,
                                title: "my fucking fucking fucking title for this fucking shit",
                                description: "even more words then in that fucking title for this description",
                              ),
                              SizedBox(width: 100,),
                              ServiceIconWidget(
                                icon: Icons.opacity,
                                title: "my fucking fucking fucking title for this fucking shit",
                                description: "even more words then in that fucking title for this description",
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ServiceIconWidget(
                                icon: Icons.opacity,
                                title: "my fucking fucking fucking title for this fucking shit",
                                description: "even more words then in that fucking title for this description",
                              ),
                              SizedBox(width: 100,),
                              ServiceIconWidget(
                                icon: Icons.opacity,
                                title: "my fucking fucking fucking title for this fucking shit",
                                description: "even more words then in that fucking title for this description",
                                onTap: (){setState(() {
                                  condition = true;
                                });},
                              ),
                            ],
                          ),
                          Spacer(),
                          _buildContact(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: condition == true,
              maintainState: true,
              maintainAnimation: true,
              child: InkWell(
                onTap: (){setState(() {
                  condition = false;
                });},
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.65,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.6),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      _buildService(
          AppText.SERVICE1_TITLE,
          AppText.SERVICE1_1 +
              "\n\n" +
              AppText.SERVICE1_2 +
              "\n\n" +
              AppText.SERVICE1_3 +
              "\n\n" +
              AppText.SERVICE1_4),
      _buildService(
          AppText.SERVICE2_TITLE,
          AppText.SERVICE2_1 +
              "\n\n" +
              AppText.SERVICE2_2 +
              "\n\n" +
              AppText.SERVICE2_3 +
              "\n\n" +
              AppText.SERVICE2_4),
      _buildService(AppText.SERVICE3_TITLE,
          AppText.SERVICE3_1),
      _buildService(AppText.SERVICE4_TITLE,
          AppText.SERVICE4_1),
    ];

    List<Widget> _buildBottom() {
      List<Widget> listWidgets = [];
      listWidgets.add(Container(
        margin: EdgeInsets.only(right: 20),
        child: IconButton(
          padding: EdgeInsets.all(0),
          iconSize: 50,
          icon: Icon(Icons.chevron_left),
          onPressed: () => _controller.previousPage(
              duration: Duration(milliseconds: 800), curve: Curves.easeOut),
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
          onPressed: () => _controller.nextPage(
              duration: Duration(milliseconds: 800), curve: Curves.easeOut),
        ),
      ));
      return listWidgets;
    }

    return BlocBuilder<MetricsBloc, Metrics>(builder: (context, state) {
      bool isMouse = state == Metrics.BIG;
      return Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
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
                          return i;
                        },
                      );
                    }).toList(),
                  ),
                  //_buildContact(),
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildBottom())
          ],
        ),
      );
    });
  }
}
