part of 'reversedns_cubit.dart';

@immutable
abstract class ReversednsState {}

class ReversednsInitial extends ReversednsState {}

class ReversednsLoading extends ReversednsState {}

class ReversednsError extends ReversednsState {
  final String? error;

  ReversednsError({required this.error});
}

class ReversednsLoaded extends ReversednsState {
  final ReverseDnsResponse? response;

  ReversednsLoaded({required this.response});
}
