part 'animated_pictures_event.dart';

enum AnimatedTitle {
  CONS_1,
  CONS_2,
  CONS_3,
  CONS_4,
  HOW_WORK_1,
  HOW_WORK_2,
  HOW_WORK_3,
}

enum CollapsingState { COLLAPSED, EXPANDED }

// abstract class AnimatedPicturesBloc extends Bloc<AnimatedPicturesEvent, AnimatedTitle> {
//   AnimatedPicturesBloc(MapEntry entry) : super(null);
//
//   @override
//   Stream<AnimatedTitle> mapEventToState(AnimatedPicturesEvent event) async* {
//     if(event is ChangePictureEvent){
//       yield event.pictureTitle;
//     }
//   }
// }
//
// class AnimatedPicturesFirstBloc extends AnimatedPicturesBloc {
//   AnimatedPicturesFirstBloc() : super(MapEntry(AnimatedTitle.CONS_1, CollapsingState.EXPANDED));
//
// }
//
// class AnimatedPicturesSecondBloc extends AnimatedPicturesBloc {
//   AnimatedPicturesSecondBloc() : super(MapEntry(AnimatedTitle.HOW_WORK_1, CollapsingState.EXPANDED));
// }
