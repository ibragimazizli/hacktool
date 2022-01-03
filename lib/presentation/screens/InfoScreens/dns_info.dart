import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whois/data/models/dnsrecord_esponse.dart';

import 'package:whois/data/models/traceroute_response.dart';

import 'package:whois/presentation/widgets/custom_icons.dart';

class DnsInfo extends StatefulWidget {
  const DnsInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final DnsRecordResponse? response;
  @override
  State<DnsInfo> createState() => _DnsInfoState();
}

class _DnsInfoState extends State<DnsInfo> {
  DnsRecordResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            " ${response.query!.domain.toString()} \n ${response.query!.tool.toString()} \n ${response.query!.recordtype.toString()}"),
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
          response.response!.records!.isEmpty
              ? const Center(child: Text("Empty"))
              : ListView.builder(
                  itemCount: response.response!.records!.length,
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
                                    "Type:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    response.response!.records![index].type
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    "Record Class:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    response
                                        .response!.records![index].recordClass
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
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
                                      response.response!.records![index].name
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Data:",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      response.response!.records![index].data!
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
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
