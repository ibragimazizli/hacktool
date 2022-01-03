part of 'dnsrecord_cubit.dart';

@immutable
abstract class DnsrecordState {}

class DnsrecordInitial extends DnsrecordState {}

class DnsrecordLoading extends DnsrecordState {}

class DnsrecordError extends DnsrecordState {
  final String? error;

  DnsrecordError({required this.error});
}

class DnsrecordLoaded extends DnsrecordState {
  final DnsRecordResponse? response;

  DnsrecordLoaded({required this.response});
}
