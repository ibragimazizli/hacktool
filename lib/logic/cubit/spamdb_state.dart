part of 'spamdb_cubit.dart';

@immutable
abstract class SpamdbState {}

class SpamdbInitial extends SpamdbState {}

class SpamdbLoading extends SpamdbState {}

class SpamdbError extends SpamdbState {
  final String? error;

  SpamdbError({required this.error});
}

class SpamdbLoaded extends SpamdbState {
  final SpamDbResponse? response;

  SpamdbLoaded({required this.response});
}
