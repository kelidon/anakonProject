part of 'collapsing_headers_bloc.dart';

class CollapsingHeadersEvent {
  CollapsingTitle title;

  CollapsingHeadersEvent(this.title);
}

class CollapseEvent extends CollapsingHeadersEvent{
  CollapseEvent(CollapsingTitle title) : super(title);
}

class ExpandEvent extends CollapsingHeadersEvent{
  ExpandEvent(CollapsingTitle title) : super(title);
}
