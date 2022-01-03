import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whois/data/models/ip_location_response.dart';
import 'package:whois/data/models/macadd_response.dart';
import 'package:whois/data/models/reverse_dns_response.dart';

import 'package:whois/data/models/traceroute_response.dart';

import 'package:whois/presentation/widgets/custom_icons.dart';
import 'package:whois/presentation/widgets/ip_info_element.dart';

class MacInfo extends StatefulWidget {
  const MacInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final MacAddressResponse? response;
  @override
  State<MacInfo> createState() => _MacInfoState();
}

class _MacInfoState extends State<MacInfo> {
  MacAddressResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            " ${response.query!.mac.toString()} \n ${response.query!.tool.toString()}"),
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
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoElement(
                  text: response.response!.manufacturer.toString().isEmpty
                      ? "Mac address Info"
                      : response.response!.manufacturer.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
