import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:whois/data/models/traceroute_response.dart';

import 'package:whois/presentation/widgets/custom_icons.dart';

class TraceroutInfo extends StatefulWidget {
  const TraceroutInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final TraceRouteResponse? response;
  @override
  State<TraceroutInfo> createState() => _TraceroutInfoState();
}

class _TraceroutInfoState extends State<TraceroutInfo> {
  TraceRouteResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          response.response!.hops!.isEmpty
              ? const Center(child: Text("Empty"))
              : ListView.builder(
                  itemCount: response.response!.hops!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.red,
                          clipBehavior: Clip.antiAlias,
                          child: Column(children: [
                            ListTile(
                              leading: const Icon(
                                CustomIcons.traceroute,
                                color: Colors.white,
                              ),
                              title: Row(
                                children: [
                                  const Text(
                                    "Number:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    response.response!.hops![index].number
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    "RTT:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    response.response!.hops![index].rtt
                                        .toString(),
                                    style:const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "Hostname:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    response.response!.hops![index].hostname
                                        .toString(),
                                    style:const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ])),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
