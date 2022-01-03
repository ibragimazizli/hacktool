import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/chinese_firewall_response.dart';
import 'package:whois/data/models/iran_firewall.dart';
import 'package:whois/repository/api_service.dart';

part 'firewall_state.dart';

class FirewallCubit extends Cubit<FirewallState> {
  ApiServices api = locator<ApiServices>();
  FirewallCubit() : super(FirewallInitial());
  void getFirewall(String url) async {
    if (url.isNotEmpty && url != "") {
      try {
        emit(FirewallLoading());
        final res = await api.getCHFirewall(url, apiKey);
        emit(FirewallChloaded(response: res));
      } catch (e) {
        emit(FirewallError(error: e.toString()));
      }
    } else {
      emit(FirewallError(error: "Hostname can not be empty"));
    }
  }
}
