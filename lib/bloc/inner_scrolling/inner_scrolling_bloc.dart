import 'package:flutter_bloc/flutter_bloc.dart';

class InnerScrollingBloc extends Bloc<bool, bool> {
  InnerScrollingBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool isInnerScroll) async* {
    yield isInnerScroll;
  }
}