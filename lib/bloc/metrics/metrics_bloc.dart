import 'package:flutter_bloc/flutter_bloc.dart';

enum Metrics { SMALL, BIG }

class MetricsBloc extends Bloc<Metrics, Metrics> {
  MetricsBloc() : super(Metrics.BIG);

  @override
  Stream<Metrics> mapEventToState(Metrics event) async* {
    yield event;
  }
}
