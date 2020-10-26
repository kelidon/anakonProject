part of 'services_items_bloc.dart';

class ServicesItemsEvent {
  CollapsingTitle title;

  ServicesItemsEvent(this.title);
}

class CollapseServiceEvent extends ServicesItemsEvent{
  CollapseEvent(CollapsingTitle title) : super(title);
}

class ExpandEvent extends ServicesItemsEvent{
  ExpandEvent(CollapsingTitle title) : super(title);
}
