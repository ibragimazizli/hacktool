import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:whois/data/models/chinese_firewall_response.dart';
import 'package:whois/data/models/dnsrecord_esponse.dart';
import 'package:whois/data/models/ip_location_response.dart';
import 'package:whois/data/models/iran_firewall.dart';
import 'package:whois/data/models/macadd_response.dart';
import 'package:whois/data/models/reverse_dns_response.dart';
import 'package:whois/data/models/spamdb_response.dart';
import 'package:whois/data/models/traceroute_response.dart';
import '../../constants/keys/request_settings.dart';
import '../../data/models/port_response.dart';

import 'package:http/http.dart' as http;

@lazySingleton
class ApiServices {
  Map<String, String> headers = {
    "x-rapidapi-host": xRapidApiHost,
    "x-rapidapi-key": xRapidApiKey,
  };
  String baseUrl = "https://community-viewdns.p.rapidapi.com";
  Future<PortResponse?> getPorts(String host, String apiKey) async {
    final res = await http.get(
      Uri.parse("$baseUrl/portscan?apikey=$apiKey&host=$host&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resultMap = json.decode(res.body);
      log(json.encode(res.body));
      return PortResponse.fromJson(resultMap);
    }
    return null;
  }

  Future<TraceRouteResponse?> getTraceroute(String host, String apiKey) async {
    final res = await http.get(
      Uri.parse('$baseUrl/traceroute?apikey=$apiKey&domain=$host&output=json'),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resultMap = json.decode(res.body);
      log(json.encode(res.body));
      return TraceRouteResponse.fromJson(resultMap);
    }
    return null;
  }

  Future<DnsRecordResponse?> getDns(String host, String apiKey) async {
    final res = await http.get(
      Uri.parse("$baseUrl/dnsrecord?apikey=$apiKey&domain=$host&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resultMap = json.decode(res.body);
      log(json.encode(res.body));
      return DnsRecordResponse.fromJson(resultMap);
    }
    return null;
  }

  Future<SpamDbResponse?> getSpamDB(String ip, String apiKey) async {
    final res = await http.get(
      Uri.parse("$baseUrl/spamdblookup?apikey=$apiKey&ip=$ip&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resultMap = json.decode(res.body);
      log(json.encode(res.body));
      return SpamDbResponse.fromJson(resultMap);
    }
    return null;
  }

  Future<IpLocationResponse?> getIpLocation(String ip, String apiKey) async {
    final res = await http.get(
      Uri.parse("$baseUrl//iplocation?apikey=$apiKey&ip=$ip&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resMap = json.decode(res.body);
      log(json.encode(res.body));
      return IpLocationResponse.fromJson(resMap);
    }
    return null;
  }

  Future<ReverseDnsResponse?> getReverseDns(String ip, String apiKey) async {
    final res = await http.get(
        Uri.parse("$baseUrl/reversedns?apikey=$apiKey&ip=$ip&output=json"),
        headers: headers);
    if (res.statusCode == 200) {
      var resMap = json.decode(res.body);
      log(json.encode(res.body));
      return ReverseDnsResponse.fromJson(resMap);
    }
    return null;
  }

  Future<MacAddressResponse?> getMacInfo(String mac, String apiKey) async {
    final res = await http.get(
      Uri.parse("$baseUrl/maclookup?apikey=$apiKey&mac=0$mac&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resMap = json.decode(res.body);
      log(json.encode(res.body));
      return MacAddressResponse.fromJson(resMap);
    }
    return null;
  }

  Future<ChFirewallResponse?> getCHFirewall(String host, String apiKey) async {
    final res = await http.get(
      Uri.parse(
          "$baseUrl/chinesefirewall?apikey=$apiKey&domain=$host&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resMap = json.decode(res.body);
      log(json.encode(res.body));
      return ChFirewallResponse.fromJson(resMap);
    }
    return null;
  }

  Future<IranFirewallResponse?> getIranFirewall(
      String url, String apiKey) async {
    final res = await http.get(
      Uri.parse(
          "$baseUrl/iranfirewall?apikey=$apiKey&siteurl=$url&output=json"),
      headers: headers,
    );
    if (res.statusCode == 200) {
      var resMap = json.decode(res.body);
      log(json.encode(res.body));
      return IranFirewallResponse.fromJson(resMap);
    }
    return null;
  }
}
