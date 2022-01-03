import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whois/data/models/ip_location_response.dart';

import 'package:whois/data/models/traceroute_response.dart';

import 'package:whois/presentation/widgets/custom_icons.dart';
import 'package:whois/presentation/widgets/ip_info_element.dart';

class IpLocationInfo extends StatefulWidget {
  const IpLocationInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final IpLocationResponse? response;
  @override
  State<IpLocationInfo> createState() => _IpLocationInfoState();
}

class _IpLocationInfoState extends State<IpLocationInfo> {
  IpLocationResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            " ${response.query!.ip.toString()} \n ${response.query!.tool.toString()}"),
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
                  text: response.response!.city.toString().isEmpty
                      ? "City"
                      : response.response!.city.toString(),
                ),
                InfoElement(
                  text: response.response!.zipcode.toString().isEmpty
                      ? "Zip code"
                      : response.response!.zipcode.toString(),
                ),
                InfoElement(
                  text: response.response!.regionCode.toString().isEmpty
                      ? "Region Code"
                      : response.response!.regionCode.toString(),
                ),
                InfoElement(
                  text: response.response!.regionName.toString().isEmpty
                      ? "Region Name"
                      : response.response!.regionName.toString(),
                ),
                InfoElement(
                  text: response.response!.countryCode.toString().isEmpty
                      ? "Country Code"
                      : response.response!.countryCode.toString(),
                ),
                InfoElement(
                  text: response.response!.countryName.toString().isEmpty
                      ? "Country Name"
                      : response.response!.countryName.toString(),
                ),
                InfoElement(
                  text: response.response!.latitude.toString().isEmpty
                      ? "Latitude"
                      : response.response!.latitude.toString(),
                ),
                InfoElement(
                  text: response.response!.longitude.toString().isEmpty
                      ? "Longitude"
                      : response.response!.longitude.toString(),
                ),
                InfoElement(
                  text: response.response!.gmtOffset.toString().isEmpty
                      ? "GMT offset"
                      : response.response!.gmtOffset.toString(),
                ),
                InfoElement(
                  text: response.response!.dstOffset.toString().isEmpty
                      ? "DS offset"
                      : response.response!.dstOffset.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
