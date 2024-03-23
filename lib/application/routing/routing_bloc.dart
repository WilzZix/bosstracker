import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'routing_event.dart';

part 'routing_state.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  RoutingBloc() : super(RoutingInitial()) {
    on<ChangeScreenEvent>((event, emit) {
      emit(RouteChangedState(event.screenIndex));
    });
  }
}
