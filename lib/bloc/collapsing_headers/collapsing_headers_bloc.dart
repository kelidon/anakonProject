import 'package:flutter_bloc/flutter_bloc.dart';
part 'collapsing_headers_event.dart';

enum CollapsingTitle{
  CONS_1,
  CONS_2,
  CONS_3,
  CONS_4,
  HOW_WORK_1,
  HOW_WORK_2,
  HOW_WORK_3,
}

enum CollapsingState {
  COLLAPSED,
  EXPANDED
}


class CollapsedHeadersBloc extends Bloc<CollapsingHeadersEvent, MapEntry<CollapsingTitle, CollapsingState>> {
  CollapsedHeadersBloc() : super(MapEntry(CollapsingTitle.CONS_1, CollapsingState.EXPANDED));

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
