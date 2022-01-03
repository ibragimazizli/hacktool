part of 'traceroute_cubit.dart';

@immutable
abstract class TracerouteState {}

class TracerouteInitial extends TracerouteState {}

class TracerouteLoading extends TracerouteState {}

// ignore: must_be_immutable
class TracerouteError extends TracerouteState {
  String? error;
  TracerouteError({required this.error});
}

class TracerouteLoaded extends TracerouteState {
  final TraceRouteResponse? response;

  TracerouteLoaded({this.response});
}
