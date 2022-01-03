import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:whois/data/models/port_response.dart';
import 'package:whois/data/models/spamdb_response.dart';

class SpamDbInfo extends StatefulWidget {
  const SpamDbInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final SpamDbResponse? response;
  @override
  State<SpamDbInfo> createState() => _SpamDbInfoState();
}

class _SpamDbInfoState extends State<SpamDbInfo> {
  SpamDbResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            "${response.query!.ip.toString()} / ${response.query!.tool.toString()}"),
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
          response.response!.dbs!.isEmpty
              ? const Center(child: Text(""))
              : ListView.builder(
                  itemCount: response.response!.dbs!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              response.response!.dbs![index].name.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        trailing: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: response.response!.dbs![index].result ==
                                    Result.OK
                                ? const Icon(
                                    Icons.assignment_turned_in_outlined,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.assignment_late_rounded,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
