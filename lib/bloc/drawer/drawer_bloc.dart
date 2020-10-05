import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerButtons { ABOUT_US, HOW_WORK, SERVICES, CONTACT_US }

const Map drawerButtonLabels = {
  DrawerButtons.ABOUT_US: "О НАС",
  DrawerButtons.HOW_WORK: "КАК РАБОТАЕМ",
  DrawerButtons.SERVICES: "УСЛУГИ",
  DrawerButtons.CONTACT_US: "КОНТАКТЫ",
};

class DrawerBloc extends Bloc<DrawerButtons, DrawerButtons> {
  DrawerBloc() : super(DrawerButtons.ABOUT_US);

  @override
  Stream<DrawerButtons> mapEventToState(DrawerButtons buttonName) async* {
    print("bloc get ${buttonName.toString()}");
    yield buttonName;
  }
}
