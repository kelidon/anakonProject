import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerButtons {ANAKON, WHO_WE_ARE, SERVICES, CONTACT_US}
const Map drawerButtonLabels = {
  DrawerButtons.ANAKON: "Anakon",
  DrawerButtons.WHO_WE_ARE: "Who we are",
  DrawerButtons.SERVICES: "Services",
  DrawerButtons.CONTACT_US: "Contact us",
};

class DrawerBloc extends Bloc<DrawerButtons, DrawerButtons> {
  DrawerBloc() : super(DrawerButtons.ANAKON);

  @override
  Stream<DrawerButtons> mapEventToState(DrawerButtons buttonName) async* {
    yield buttonName;
  }
}
