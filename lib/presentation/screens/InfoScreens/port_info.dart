import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:whois/data/models/port_response.dart';

class PortInfo extends StatefulWidget {
  const PortInfo({
    required this.response,
    Key? key,
  }) : super(key: key);
  final PortResponse? response;
  @override
  State<PortInfo> createState() => _PortInfoState();
}

class _PortInfoState extends State<PortInfo> {
  PortResponse get response => widget.response!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
            "${response.query!.host.toString()} / ${response.query!.tool.toString()}"),
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
          response.response!.port!.isEmpty
              ? const Center(child: Text(""))
              : ListView.builder(
                  itemCount: response.response!.port!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              response.response!.port![index].number.toString(),
                              style:const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        title: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              response.response!.port![index].service
                                  .toString(),
                              style:const TextStyle(color: Colors.white),
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
                            child: response.response!.port![index].status ==
                                    Status.CLOSED
                                ? const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  )
                                :const  Icon(
                                    Icons.lock_open,
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
