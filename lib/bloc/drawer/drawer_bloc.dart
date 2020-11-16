import 'package:flutter_bloc/flutter_bloc.dart';

enum DrawerButtons { ABOUT_US, HOW_WORK, SERVICES }

const Map drawerButtonLabels = {
  DrawerButtons.ABOUT_US: "НАШИ ПРЕИМУЩЕСТВА",
  DrawerButtons.HOW_WORK: "КАК МЫ РАБОТАЕМ?",
  DrawerButtons.SERVICES: "УСЛУГИ",
};

class DrawerBloc extends Bloc<DrawerButtons, DrawerButtons> {
  DrawerBloc() : super(DrawerButtons.ABOUT_US);

  @override
  Stream<DrawerButtons> mapEventToState(DrawerButtons buttonName) async* {
    yield buttonName;
  }
}
