part of 'routing_bloc.dart';

@immutable
abstract class RoutingState {}

class RoutingInitial extends RoutingState {}

class RouteChangedState extends RoutingState {
  final int screenIndex;

  RouteChangedState(this.screenIndex);
}
