import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/data/models/traceroute_response.dart';
import 'package:whois/repository/api_service.dart';
import '../../constants/keys/request_settings.dart';
part 'traceroute_state.dart';

class TracerouteCubit extends Cubit<TracerouteState> {
  TracerouteCubit() : super(TracerouteInitial());

  ApiServices service = locator<ApiServices>();

  void getTraceroute(String host) async {
    try {
      emit(TracerouteLoading());

      if (host.isNotEmpty && host != "") {
        final res = await service.getTraceroute(host, apiKey);
        emit(TracerouteLoaded(response: res));
      } else {
        emit(TracerouteError(error: "Host could not be empty"));
      }
    } catch (e) {
      emit(TracerouteError(error: e.toString()));
    }
  }
}
