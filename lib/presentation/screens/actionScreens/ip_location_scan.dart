import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whois/logic/cubit/iplocation_cubit.dart';
import 'package:whois/logic/cubit/prot_scanner_cubit.dart';
import 'package:whois/logic/cubit/spamdb_cubit.dart';
import 'package:whois/presentation/screens/InfoScreens/iplocation_info.dart';

import 'package:whois/presentation/screens/InfoScreens/spamdb_info.dart';
import 'package:whois/presentation/widgets/input_feld.dart';

class IpLocationScan extends StatelessWidget {
  IpLocationScan({Key? key}) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IplocationCubit, IplocationState>(
        listener: (context, state) {
      if (state is IplocationError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error!),
          duration: const Duration(seconds: 3),
        ));
      } else if (state is Iplocationloaded) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IpLocationInfo(
              response: state.resp!,
            ),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is IplocationLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/back.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 11.0, sigmaY: 11.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "IP LOCATION SCANNER",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InputField(
                      validator: (value) {
                        if (value!.isEmpty) return ' Field can not be empty';
                        return value;
                      },
                      controller: controller,
                      fieldName: "IP",
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(2, 26, 63, 1),
                            )),
                        onPressed: () {
                          BlocProvider.of<IplocationCubit>(context)
                              .getIpLocation(controller.text);
                        },
                        child: const Text("Search"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
