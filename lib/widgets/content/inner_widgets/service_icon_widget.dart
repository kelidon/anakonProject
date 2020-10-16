import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceIconWidget extends StatefulWidget{
  final IconData icon;
  final String title;
  final String description;
  final Function onTap;

  const ServiceIconWidget({Key key, this.icon, this.title, this.description, this.onTap}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ServiceIconWidgetState(icon, title, description, onTap);

}

class _ServiceIconWidgetState extends State<ServiceIconWidget>{
  final IconData icon;
  final String title;
  final String description;
  final Function onTap;

  _ServiceIconWidgetState(this.icon, this.title, this.description, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.15,
        height: MediaQuery.of(context).size.width*0.1,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4,
                offset: Offset(1, 3)
            ),
          ],// boxShadow
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              Spacer(),
              Text(title, style: AppStyles.REGULAR,softWrap: true,)
            ],
          ),
        ),
      ),
    );
  }

}
