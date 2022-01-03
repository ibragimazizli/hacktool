import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whois/DI/injection.dart';
import 'package:whois/logic/cubit/dnsrecord_cubit.dart';
import 'package:whois/logic/cubit/firewall_cubit.dart';
import 'package:whois/logic/cubit/iplocation_cubit.dart';
import 'package:whois/logic/cubit/mac_cubit.dart';
import 'package:whois/logic/cubit/reversedns_cubit.dart';
import 'package:whois/logic/cubit/spamdb_cubit.dart';
import 'package:whois/logic/cubit/traceroute_cubit.dart';

import 'logic/cubit/prot_scanner_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PortScannerCubit>(
          create: (context) => PortScannerCubit(),
        ),
        BlocProvider<TracerouteCubit>(
          create: (context) => TracerouteCubit(),
        ),
        BlocProvider<DnsrecordCubit>(
          create: (context) => DnsrecordCubit(),
        ),
        BlocProvider<SpamdbCubit>(
          create: (context) => SpamdbCubit(),
        ),
        BlocProvider<IplocationCubit>(
          create: (context) => IplocationCubit(),
        ),
        BlocProvider<ReversednsCubit>(
          create: (context) => ReversednsCubit(),
        ),
        BlocProvider<MacCubit>(
          create: (context) => MacCubit(),
        ),
        BlocProvider<FirewallCubit>(
          create: (context) => FirewallCubit(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
