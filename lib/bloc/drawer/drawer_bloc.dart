import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerButtons { ABOUT_US, SERVICES, CONTACT_US }

const Map drawerButtonLabels = {
  DrawerButtons.ABOUT_US: "Who we are",
  DrawerButtons.SERVICES: "Services",
  DrawerButtons.CONTACT_US: "Contact us",
};

class DrawerBloc extends Bloc<DrawerButtons, DrawerButtons> {
  DrawerBloc() : super(DrawerButtons.ABOUT_US);

  @override
  Stream<DrawerButtons> mapEventToState(DrawerButtons buttonName) async* {
    print("bloc get ${buttonName.toString()}");
    yield buttonName;
  }
}
