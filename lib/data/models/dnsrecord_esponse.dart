// To parse this JSON data, do
//
//     final dnsRecordResponse = dnsRecordResponseFromJson(jsonString);

import 'dart:convert';

DnsRecordResponse dnsRecordResponseFromJson(String str) =>
    DnsRecordResponse.fromJson(json.decode(str));

String dnsRecordResponseToJson(DnsRecordResponse data) =>
    json.encode(data.toJson());

class DnsRecordResponse {
  DnsRecordResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory DnsRecordResponse.fromJson(Map<String, dynamic> json) =>
      DnsRecordResponse(
        query: Query.fromJson(json["query"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query!.toJson(),
        "response": response!.toJson(),
      };
}

class Query {
  Query({
    this.tool,
    this.domain,
    this.recordtype,
  });

  String? tool;
  String? domain;
  String? recordtype;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        domain: json["domain"],
        recordtype: json["recordtype"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "domain": domain,
        "recordtype": recordtype,
      };
}

class Response {
  Response({
    this.records,
  });

  List<Record>? records;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class Record {
  Record({
    this.name,
    this.ttl,
    this.recordClass,
    this.type,
    this.data,
  });

  String? name;
  String? ttl;
  String? recordClass;
  String? type;
  String? data;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        name: json["name"],
        ttl: json["ttl"],
        recordClass: json["class"],
        type: json["type"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ttl": ttl,
        "class": recordClass,
        "type": type,
        "data": data,
      };
}
