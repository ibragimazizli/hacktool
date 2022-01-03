import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/constants/keys/request_settings.dart';
import 'package:whois/data/models/spamdb_response.dart';
import 'package:whois/repository/api_service.dart';

part 'spamdb_state.dart';

class SpamdbCubit extends Cubit<SpamdbState> {
  ApiServices api = locator<ApiServices>();
  SpamdbCubit() : super(SpamdbInitial());

  void getSpamDb(String ip) async {
    try {
      emit(SpamdbLoading());
      if (ip.isNotEmpty && ip != "") {
        final res = await api.getSpamDB(ip, apiKey);
        emit(SpamdbLoaded(response: res));
      } else {
        emit(SpamdbError(error: "Ip could not be empty"));
      }
    } catch (e) {
      emit(SpamdbError(error: e.toString()));
    }
  }
}
