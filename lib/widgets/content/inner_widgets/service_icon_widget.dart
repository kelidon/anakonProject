import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/metrics/metrics_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_type_to_state_mapper.dart';
import 'package:anakonProject/constants/styles.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceIconWidget extends StatefulWidget {
  final ServicesPageType serviceType;

  const ServiceIconWidget({Key key, this.serviceType}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ServiceIconWidgetState(serviceType);
}

class _ServiceIconWidgetState extends State<ServiceIconWidget> {
  final ServicesPageType serviceType;

  _ServiceIconWidgetState(this.serviceType);

  @override
  Widget build(BuildContext context) {
    showModal(){showModalBottomSheet(context: context, builder: (context){
      return Container(
        color: Color(0xFF737373),
        child: Container(
          decoration: BoxDecoration(
            color:Colors.white,
              // image:DecorationImage(
              //  image: AssetImage("assets/images/blur.jpg"),
              //    fit:BoxFit.cover,
              // ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: DraggableScrollableSheet (
            initialChildSize: 0.6,
            expand:false,
             builder: (context, scrollController){
            return Container(
              child: SingleChildScrollView(
                controller: scrollController,
                child:
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                            AppText.ABOUT_US_TITLE, style: AppStyles.REGULAR_SERVICES
                        ),
                        Text(
                          AppText.ABOUT_US_1_CONTENT, style: AppStyles.REGULAR_SERVICES
                        ),
                      ],
                    ),
                  ),
              ),
            );
          }
    ),
        ),
      );
    }
    );
    }
    return BlocBuilder<MetricsBloc, Metrics>(
      builder: (_,state)
      {
      bool isMouse = state == Metrics.BIG;
        return BlocBuilder<ServicesItemsBloc, MapEntry<ServicesPageType, CollapsingState>>(
          builder: (_, state) {
            return InkWell(
              onTap: (){
               if (isMouse) {
                  if (context.bloc<ServicesItemsBloc>().state.value ==
                      CollapsingState.COLLAPSED){
                    context.bloc<ServicesItemsBloc>().add(ExpandServiceEvent(serviceType));
                  }
                }
                else {
                showModal();
                }
              },
              child: BlocBuilder<MetricsBloc, Metrics>(
                  builder: (_, state) {
                    bool isMouse = state == Metrics.BIG;
                    return Container(
                      width: isMouse?MediaQuery.of(context).size.width*0.2:null,
                      height: isMouse?MediaQuery.of(context).size.height*0.18:80,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(1, 3)
                          ),
                        ],// boxShadow
                      ),
                      child: Center(
                        child: Text(ServicesTypeToStateMapper.typeToStateMapMobile[serviceType].key, style: AppStyles.REGULAR, textAlign: TextAlign.center,),
                      ),
                    );
                  }
              ),
            );
          }
      );
      },
    );
  }

}
