part of 'mac_cubit.dart';

@immutable
abstract class MacState {}

class MacInitial extends MacState {}

class MacLoading extends MacState {}

class MacError extends MacState {
  final String? error;

  MacError({required this.error});
}

class MacLoaded extends MacState {
  final MacAddressResponse? response;

  MacLoaded({required this.response});
}
