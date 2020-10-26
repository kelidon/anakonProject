part of 'services_items_bloc.dart';

class ServicesItemsEvent {
  ServicesPageType title;

  ServicesItemsEvent(this.title);
}

class CollapseServiceEvent extends ServicesItemsEvent{
  CollapseServiceEvent(ServicesPageType title) : super(title);
}

class ExpandServiceEvent extends ServicesItemsEvent{
  ExpandServiceEvent(ServicesPageType title) : super(title);
}
