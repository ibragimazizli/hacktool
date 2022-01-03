import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/repository/api_service.dart';
import '../../constants/keys/request_settings.dart';

import '../../data/models/port_response.dart';

part 'port_scanner_state.dart';

class PortScannerCubit extends Cubit<PortScannerState> {
  PortScannerCubit() : super(PortScannerInitial());
  ApiServices service = locator<ApiServices>();
  void getPorts(String host) async {
    try {
      emit(PortScannerLoading());
      if (host.isNotEmpty) {
        final res = await service.getPorts(
          host,
          apiKey,
        );
        emit(PortScannerLoaded(response: res));
      } else {
        emit(
          PortScannerError(
            error: "Can not be empty",
          ),
        );
      }
    } catch (e) {
      emit(
        PortScannerError(
          error: e.toString(),
        ),
      );
    }
  }
}
