part of 'animated_pictures_bloc.dart';

class AnimatedPicturesEvent {
  AnimatedTitle pictureTitle;

  AnimatedPicturesEvent(this.pictureTitle);
}

class ChangePictureEvent extends AnimatedPicturesEvent{
  ChangePictureEvent(AnimatedTitle title) : super(title);
}
