import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/macadd_response.dart';
import 'package:whois/repository/api_service.dart';

part 'mac_state.dart';

class MacCubit extends Cubit<MacState> {
  ApiServices api = locator<ApiServices>();
  MacCubit() : super(MacInitial());
  void getMacInfo(String mac) async {
    if (mac.isNotEmpty && mac != "") {
      // try {
        emit(MacLoading());
        final res = await api.getMacInfo(mac, apiKey);
        emit(MacLoaded(response: res));
      // } catch (e) {
      //   emit(MacError(error: e.toString()));
      // }
    } else {
      emit(MacError(error: "Mac address can't be empty"));
    }
  }
}
