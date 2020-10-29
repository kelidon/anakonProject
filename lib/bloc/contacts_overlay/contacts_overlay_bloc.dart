import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsOverlayBloc extends Bloc<bool, bool> {
  ContactsOverlayBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool isOverlayShown) async* {
    yield isOverlayShown;
  }
}
