// To parse this JSON data, do
//
//     final chFirewallResponse = chFirewallResponseFromJson(jsonString);

import 'dart:convert';

ChFirewallResponse chFirewallResponseFromJson(String str) =>
    ChFirewallResponse.fromJson(json.decode(str));

String chFirewallResponseToJson(ChFirewallResponse data) =>
    json.encode(data.toJson());

class ChFirewallResponse {
  ChFirewallResponse({
    this.query,
    this.expectedresponse,
    this.response,
    this.v2Response,
  });

  Query? query;
  Expectedresponse? expectedresponse;
  Response? response;
  V2Response? v2Response;

  factory ChFirewallResponse.fromJson(Map<String, dynamic> json) =>
      ChFirewallResponse(
        query: Query.fromJson(json["query"]),
        expectedresponse: expectedresponseValues.map![json["expectedresponse"]],
        response: Response.fromJson(json["response"]),
        v2Response: V2Response.fromJson(json["v2response"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query!.toJson(),
        "expectedresponse": expectedresponseValues.reverse[expectedresponse],
        "response": response!.toJson(),
        "v2response": v2Response!.toJson(),
      };
}

// ignore: constant_identifier_names
enum Expectedresponse { THE_35186238101 }

final expectedresponseValues =
    EnumValues({"35.186.238.101": Expectedresponse.THE_35186238101});

class Query {
  Query({
    this.tool,
    this.domain,
  });

  String? tool;
  String? domain;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        domain: json["domain"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "domain": domain,
      };
}

class Response {
  Response({
    this.detail,
    this.summary,
  });

  Detail? detail;
  SummaryClass? summary;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        detail: Detail.fromJson(json["detail"]),
        summary: SummaryClass.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail!.toJson(),
        "summary": summary!.toJson(),
      };
}

class Detail {
  Detail({
    this.server,
  });

  List<Server>? server;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        server:
            List<Server>.from(json["server"].map((x) => Server.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "server": List<dynamic>.from(server!.map((x) => x.toJson())),
      };
}

class Server {
  Server({
    this.location,
    this.resultvalue,
    this.resultstatus,
  });

  String? location;
  Expectedresponse? resultvalue;
  SummaryEnum? resultstatus;

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        location: json["location"],
        resultvalue: expectedresponseValues.map![json["resultvalue"]],
        resultstatus: summaryEnumValues.map![json["resultstatus"]],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "resultvalue": expectedresponseValues.reverse[resultvalue],
        "resultstatus": summaryEnumValues.reverse[resultstatus],
      };
}

// ignore: constant_identifier_names
enum SummaryEnum { OK }

final summaryEnumValues = EnumValues({"ok": SummaryEnum.OK});

class SummaryClass {
  SummaryClass({
    this.result,
    this.description,
  });

  String? result;
  String? description;

  factory SummaryClass.fromJson(Map<String, dynamic> json) => SummaryClass(
        result: json["result"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "description": description,
      };
}

class V2Response {
  V2Response({
    this.dnsresults,
    this.httpresults,
  });

  Dnsresults? dnsresults;
  Httpresults? httpresults;

  factory V2Response.fromJson(Map<String, dynamic> json) => V2Response(
        dnsresults: Dnsresults.fromJson(json["dnsresults"]),
        httpresults: Httpresults.fromJson(json["httpresults"]),
      );

  Map<String, dynamic> toJson() => {
        "dnsresults": dnsresults!.toJson(),
        "httpresults": httpresults!.toJson(),
      };
}

class Dnsresults {
  Dnsresults({
    this.server,
    this.summary,
    this.description,
  });

  List<Server>? server;
  String? summary;
  String? description;

  factory Dnsresults.fromJson(Map<String, dynamic> json) => Dnsresults(
        server:
            List<Server>.from(json["server"].map((x) => Server.fromJson(x))),
        summary: json["summary"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "server": List<dynamic>.from(server!.map((x) => x.toJson())),
        "summary": summary,
        "description": description,
      };
}

class Httpresults {
  Httpresults({
    this.detail,
    this.summary,
    this.description,
  });

  String? detail;
  SummaryEnum? summary;
  String? description;

  factory Httpresults.fromJson(Map<String, dynamic> json) => Httpresults(
        detail: json["detail"],
        summary: summaryEnumValues.map![json["summary"]],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "summary": summaryEnumValues.reverse[summary],
        "description": description,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
