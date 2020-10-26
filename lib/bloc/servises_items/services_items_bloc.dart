import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'services_items_event.dart';

enum ServicesFirstPage{
  FIRST_PAGE_1,
  FIRST_PAGE_2,
  FIRST_PAGE_3,
  FIRST_PAGE_4,
}

enum ServicesSecondPage{
  SECOND_PAGE_1,
  SECOND_PAGE_2,
  SECOND_PAGE_3,
  SECOND_PAGE_4,
}


class ServicesItemsFirstPageBloc extends Bloc<CollapsingHeadersEvent, MapEntry<ServicesFirstPage, CollapsingState>> {
  ServicesItemsFirstPageBloc() : super(MapEntry(ServicesFirstPage.FIRST_PAGE_1, CollapsingState.COLLAPSED));

  @override
  Stream<MapEntry<ServicesFirstPage, CollapsingState>> mapEventToState(CollapsingHeadersEvent event) async* {
    if(event is CollapseEvent){
      print("COLLAPSE  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.COLLAPSED);
    } else if(event is ExpandEvent){
      print("Expand  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.EXPANDED);
    }
  }
}

class ServicesItemsSecondPageBloc extends Bloc<CollapsingHeadersEvent, MapEntry<CollapsingTitle, CollapsingState>> {
  ServicesItemsSecondPageBloc() : super(MapEntry(CollapsingTitle.HOW_WORK_1, CollapsingState.EXPANDED));

  @override
  Stream<MapEntry<CollapsingTitle, CollapsingState>> mapEventToState(CollapsingHeadersEvent event) async* {
    if(event is CollapseEvent){
      print("COLLAPSE  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.COLLAPSED);
    } else if(event is ExpandEvent){
      print("Expand  "+event.title.toString());
      yield MapEntry(event.title, CollapsingState.EXPANDED);
    }
  }
}
