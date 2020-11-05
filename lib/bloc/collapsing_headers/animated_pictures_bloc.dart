import 'package:flutter_bloc/flutter_bloc.dart';
part 'animated_pictures_event.dart';

enum AnimatedTitle{
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

abstract class AnimatedPicturesBloc extends Bloc<CollapsingHeadersEvent, MapEntry<AnimatedTitle, CollapsingState>> {
  AnimatedPicturesBloc(MapEntry entry) : super(entry);

  @override
  Stream<MapEntry<AnimatedTitle, CollapsingState>> mapEventToState(CollapsingHeadersEvent event) async* {
    if(event is CollapseEvent){
      yield MapEntry(event.title, CollapsingState.COLLAPSED);
    } else if(event is ExpandEvent){
      yield MapEntry(event.title, CollapsingState.EXPANDED);
    }
  }
}

class AnimatedPicturesFirstBloc extends AnimatedPicturesBloc {
  AnimatedPicturesFirstBloc() : super(MapEntry(AnimatedTitle.CONS_1, CollapsingState.EXPANDED));

}

class AnimatedPicturesSecondBloc extends AnimatedPicturesBloc {
  AnimatedPicturesSecondBloc() : super(MapEntry(AnimatedTitle.HOW_WORK_1, CollapsingState.EXPANDED));
}
