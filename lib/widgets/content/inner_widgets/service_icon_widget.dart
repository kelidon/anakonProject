import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceIconWidget extends StatefulWidget{
  final ServicesPageType serviceType;

  const ServiceIconWidget({Key key, this.serviceType}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServiceIconWidgetState(serviceType);
}

class _ServiceIconWidgetState extends State<ServiceIconWidget>{
  final ServicesPageType serviceType;

  _ServiceIconWidgetState(this.serviceType);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesItemsBloc, MapEntry<ServicesPageType, CollapsingState>>(
      builder: (_, state) {
        return InkWell(
          onTap: (){
            if (context.bloc<ServicesItemsBloc>().state.value ==
                CollapsingState.COLLAPSED){
              context.bloc<ServicesItemsBloc>().add(ExpandServiceEvent(serviceType));
            }
          },
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
                  Text(ServicesTypeToStateMapper.typeToStateMap[serviceType].key, style: AppStyles.REGULAR,softWrap: true,)
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}
