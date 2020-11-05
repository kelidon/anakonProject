part of 'animated_pictures_bloc.dart';

class CollapsingHeadersEvent {
  AnimatedTitle title;

  CollapsingHeadersEvent(this.title);
}

class CollapseEvent extends CollapsingHeadersEvent{
  CollapseEvent(AnimatedTitle title) : super(title);
}

class ExpandEvent extends CollapsingHeadersEvent{
  ExpandEvent(AnimatedTitle title) : super(title);
}
