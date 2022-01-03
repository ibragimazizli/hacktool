import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/dnsrecord_esponse.dart';
import 'package:whois/repository/api_service.dart';

part 'dnsrecord_state.dart';

class DnsrecordCubit extends Cubit<DnsrecordState> {
  ApiServices apiServices = locator<ApiServices>();
  DnsrecordCubit() : super(DnsrecordInitial());

  void getDns(String host) async {
    try {
      emit(DnsrecordLoading());
      if (host.isNotEmpty && host != "") {
        final res = await apiServices.getDns(host, apiKey);
        emit(DnsrecordLoaded(response: res));
      } else {
        emit(DnsrecordError(error: "Host could not be empty"));
      }
    } catch (e) {
      emit(DnsrecordError(error: e.toString()));
    }
  }
}
