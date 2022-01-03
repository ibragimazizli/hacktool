import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whois/presentation/screens/actionScreens/mac_scan.dart';
import 'package:whois/presentation/screens/actionScreens/port_scan.dart';
import 'package:whois/presentation/screens/actionScreens/rdns_scan.dart';
import 'package:whois/presentation/screens/actionScreens/spamdb_scan.dart';
import 'package:whois/presentation/screens/actionScreens/traeroute_scan.dart';
import 'package:whois/presentation/widgets/custom_icons.dart';

import 'actionScreens/dns_scan.dart';
import 'actionScreens/firewall_action.dart';
import 'actionScreens/ip_location_scan.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 25,
          elevation: 0.2,
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "port", icon: Icon(CustomIcons.port, size: 25)),
              Tab(text: "ping", icon: Icon(CustomIcons.traceroute, size: 25)),
              Tab(text: "dns", icon: Icon(CustomIcons.dns, size: 25)),
              Tab(text: "spam", icon: Icon(CustomIcons.spam, size: 25)),
              Tab(text: "ip", icon: Icon(CustomIcons.mac, size: 25)),
              Tab(text: "rdns", icon: Icon(CustomIcons.dns, size: 25)),
              Tab(text: "mac", icon: Icon(CustomIcons.mac, size: 25)),
              Tab(text: "firewall", icon: Icon(CustomIcons.firewall, size: 25)),
              Tab(
                text: "More",
                icon: Icon(Icons.more_horiz_sharp, size: 25),
              )
            ],
          ),
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
            TabBarView(
              children: [
                PortScans(),
                TraceRouteScan(),
                DnsScan(),
                SpamDbScan(),
                IpLocationScan(),
                RdnsScan(),
                MacScan(),
                FireWallScan(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                        "If you want to access more tools and unlimited scan count please contact with: \nibragim.abdulazizli@gmail.com",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
