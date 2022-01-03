part of 'firewall_cubit.dart';

@immutable
abstract class FirewallState {}

class FirewallInitial extends FirewallState {}

class FirewallLoading extends FirewallState {}

class FirewallError extends FirewallState {
  final String? error;

  FirewallError({required this.error});
}

class FirewallChloaded extends FirewallState {
  final ChFirewallResponse? response;

  FirewallChloaded({
    required this.response,
  });
}
