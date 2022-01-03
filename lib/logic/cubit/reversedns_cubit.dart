import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/reverse_dns_response.dart';
import 'package:whois/repository/api_service.dart';

part 'reversedns_state.dart';

class ReversednsCubit extends Cubit<ReversednsState> {
  ApiServices apiServices = locator<ApiServices>();
  ReversednsCubit() : super(ReversednsInitial());

  void getReverseDns(String ip) async {
    if (ip.isNotEmpty && ip != "") {
      try {
        emit(ReversednsLoading());
        final res = await apiServices.getReverseDns(ip, apiKey);
        emit(ReversednsLoaded(response: res));
      } catch (e) {
        emit(ReversednsError(error: e.toString()));
      }
    } else {
      emit(ReversednsError(error: "Ip could not be empty"));
    }
  }
}
