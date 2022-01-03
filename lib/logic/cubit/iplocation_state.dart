part of 'iplocation_cubit.dart';

@immutable
abstract class IplocationState {}

class IplocationInitial extends IplocationState {}

class IplocationLoading extends IplocationState {}

class Iplocationloaded extends IplocationState {
  final IpLocationResponse? resp;

  Iplocationloaded({required this.resp});
}

class IplocationError extends IplocationState {
  final String? error;

  IplocationError({required this.error});
}
