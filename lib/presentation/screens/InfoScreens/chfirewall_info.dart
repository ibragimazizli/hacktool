import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whois/data/models/chinese_firewall_response.dart';
import 'package:whois/data/models/dnsrecord_esponse.dart';

import 'package:whois/data/models/traceroute_response.dart';

import 'package:whois/presentation/widgets/custom_icons.dart';

class FirewallInfo extends StatefulWidget {
  const FirewallInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final ChFirewallResponse? response;
  @override
  State<FirewallInfo> createState() => _FirewallInfoState();
}

class _FirewallInfoState extends State<FirewallInfo> {
  ChFirewallResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            " ${response.query!.domain.toString()} \n ${response.query!.tool.toString()}"),
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
          response.response!.summary!.result!.isEmpty
              ? const Center(child: Text("Empty"))
              : ListView.builder(
                  itemCount: response.response!.detail!.server!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.red,
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    CustomIcons.traceroute,
                                    color: Colors.white,
                                  ),
                                  title: Row(
                                    children: [
                                      const Text(
                                        "Location:",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        response.response!.detail!
                                            .server![index].location
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Result Status:",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            response.response!.detail!
                                                .server![index].resultstatus
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Result Values:",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            response.response!.detail!
                                                .server![index].resultvalue
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SingleChildScrollView(
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Summary:",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            response
                                                .response!.summary!.description
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
