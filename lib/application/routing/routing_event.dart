part of 'routing_bloc.dart';

@immutable
abstract class RoutingEvent {}

class ChangeScreenEvent extends RoutingEvent {
  final int screenIndex;

  ChangeScreenEvent(this.screenIndex);
}
