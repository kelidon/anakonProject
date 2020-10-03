import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatefulWidget {
  final double height;

  const ServicesWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServicesWidgetState(height);
}

class _ServicesWidgetState extends State<ServicesWidget> {
  final double height;

  _ServicesWidgetState(this.height);

  @override
  Widget build(BuildContext context) {
    var list = [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.indigo.withOpacity(0.4),
          ),
          margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
          child: Center(
              child: Text("services 1", style: TextStyle(fontSize: 50)))),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.indigo.withOpacity(0.4),
          ),
          margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
          child: Center(
              child: Text("services 2", style: TextStyle(fontSize: 50)))),
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.indigo.withOpacity(0.4),
          ),
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child:
              Center(child: Text("services 3", style: TextStyle(fontSize: 50))))
    ];
    return CarouselSlider(
      options: CarouselOptions(
          height: height, enableInfiniteScroll: false, viewportFraction: 1),
      items: list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return i;
          },
        );
      }).toList(),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //     color: Colors.indigo.withOpacity(0.4),
    //   ),
    //   height: MediaQuery.of(context).size.height - 110,
    //   margin: EdgeInsets.only(top: 20, bottom: 20),
    //   child: Center(child: Text("services", style: TextStyle(fontSize: 50))));
  }
}
