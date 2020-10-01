import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<bool, bool> {
  MenuBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool isEnabled) async* {
    yield isEnabled;
  }
}
