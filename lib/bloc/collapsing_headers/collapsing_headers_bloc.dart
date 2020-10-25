import 'package:flutter_bloc/flutter_bloc.dart';
part 'collapsing_headers_event.dart';

enum CollapsingTitle{
  CONS_1,
  CONS_2,
  CONS_3,
  CONS_4,
}

enum CollapsingState {
  COLLAPSED,
  EXPANDED
}


class DrawerBloc extends Bloc<CollapsingHeadersEvent, Map<CollapsingHeadersEvent, bool>> {
  DrawerBloc() : super(null);

  @override
  Stream<Map<CollapsingHeadersEvent, bool>> mapEventToState(CollapsingHeadersEvent event) async* {
    if(event is CollapseEvent){

    } e
  }
}
