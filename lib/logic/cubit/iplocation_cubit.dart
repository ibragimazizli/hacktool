import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/ip_location_response.dart';
import 'package:whois/repository/api_service.dart';

part 'iplocation_state.dart';

class IplocationCubit extends Cubit<IplocationState> {
  ApiServices api = locator<ApiServices>();
  IplocationCubit() : super(IplocationInitial());
  void getIpLocation(String ip) async {
    try {
      emit(IplocationLoading());
      if (ip.isNotEmpty && ip != "") {
        final res = await api.getIpLocation(ip, apiKey);
        emit(Iplocationloaded(resp: res));
      } else {
        emit(IplocationError(error: "Ip could not be empty"));
      }
    } catch (e) {
      emit(IplocationError(error: e.toString()));
    }
  }
}
