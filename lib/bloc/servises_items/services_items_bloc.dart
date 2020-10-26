import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'services_items_event.dart';

enum ServicesPageType{
  FIRST_PAGE_1,
  FIRST_PAGE_2,
  FIRST_PAGE_3,
  FIRST_PAGE_4,
  SECOND_PAGE_1,
  SECOND_PAGE_2,
  SECOND_PAGE_3,
  SECOND_PAGE_4,
}



class ServicesItemsBloc extends Bloc<ServicesItemsEvent, MapEntry<ServicesPageType, CollapsingState>> {
  ServicesItemsBloc() : super(MapEntry(ServicesPageType.FIRST_PAGE_1, CollapsingState.COLLAPSED));

  @override
  Stream<MapEntry<ServicesPageType, CollapsingState>> mapEventToState(ServicesItemsEvent event) async* {
    if(event is CollapseEvent){
      print("COLLAPSE  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.COLLAPSED);
    } else if(event is ExpandEvent){
      print("Expand  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.EXPANDED);
    }
  }
}

