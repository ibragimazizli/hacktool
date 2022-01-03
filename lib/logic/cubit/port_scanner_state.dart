part of 'prot_scanner_cubit.dart';

@immutable
abstract class PortScannerState {}

class PortScannerInitial extends PortScannerState {}

// ignore: must_be_immutable
class PortScannerError extends PortScannerState {
  String? error;
  PortScannerError({required this.error});
}

class PortScannerLoading extends PortScannerState {}

class PortScannerLoaded extends PortScannerState {
  final PortResponse? response;

  PortScannerLoaded({required this.response});
}
