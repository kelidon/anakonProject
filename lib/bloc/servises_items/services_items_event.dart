part of 'services_items_bloc.dart';

class ServicesItemsEvent {
  ServicesPageType serviceType;

  ServicesItemsEvent(this.serviceType);
}

class CollapseServiceEvent extends ServicesItemsEvent{
  CollapseServiceEvent(ServicesPageType title) : super(title);
}

class ExpandServiceEvent extends ServicesItemsEvent{
  ExpandServiceEvent(ServicesPageType title) : super(title);
}
