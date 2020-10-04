import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
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

  _buildService(String imagePath, String title, String text) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.cover)),
        margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text(title, style: TextStyle(fontSize: 50), textAlign: TextAlign.left,),
              SizedBox(height: 20),
              Text(text, style: TextStyle(fontSize: 20)),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var list = [
      _buildService("assets/images/documents.jpg", "DOCUMENTS",
          "hbf jFBJSD JDSFBBD ssjacjd dfbajjdsb dfbahsdbh hBDAS DBAHSDBCJASD DCHBASDJC  DSCHSADBCJASDC DD CHD D HD BDD HD BSDDHSS CBdC DS BDD HDBCN BB DS"),
      _buildService("assets/images/technical.jpg", "TECHNICAL",
          "hbf jFBJSD JDSFBBD ssjacjd dfbajjdsb dfbahsdbh hBDAS DBAHSDBCJASD DCHBASDJC  DSCHSADBCJASDC DD CHD D HD BDD HD BSDDHSS CBdC DS BDD HDBCN BB DS"),
      _buildService("assets/images/renewal.jpg", "RENEWAL",
          "hbf jFBJSD JDSFBBD ssjacjd dfbajjdsb dfbahsdbh hBDAS DBAHSDBCJASD DCHBASDJC  DSCHSADBCJASDC DD CHD D HD BDD HD BSDDHSS CBdC DS BDD HDBCN BB DS"),
      _buildService("assets/images/led_lamp.jpg", "LED LAMP",
          "hbf jFBJSD JDSFBBD ssjacjd dfbajjdsb dfbahsdbh hBDAS DBAHSDBCJASD DCHBASDJC  DSCHSADBCJASDC DD CHD D HD BDD HD BSDDHSS CBdC DS BDD HDBCN BB DS"),
    ];
    List<Widget> _buildBottom() {
      List<Widget> listWidgets = [];
      listWidgets.add(Container(
        margin: EdgeInsets.only(right: 20),
        child: IconButton(
          padding: EdgeInsets.all(0),
          iconSize: 50,
          icon: Icon(Icons.chevron_left),
          onPressed: () => _controller.previousPage(duration: Duration(milliseconds: 800), curve: Curves.easeOut),
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
          onPressed: () => _controller.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeOut),
        ),
      ));
      return listWidgets;
    }

    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (context, state) {
        bool isMouse = state==Metrics.BIG;
        return Container(
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
              isMouse?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildBottom()):Container(),
            ],
          ),
        );
      }
    );
  }
}
