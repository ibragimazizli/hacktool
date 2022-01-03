// To parse this JSON data, do
//
//     final reverseDnsResponse = reverseDnsResponseFromJson(jsonString);

import 'dart:convert';

ReverseDnsResponse reverseDnsResponseFromJson(String str) =>
    ReverseDnsResponse.fromJson(json.decode(str));

String reverseDnsResponseToJson(ReverseDnsResponse data) =>
    json.encode(data.toJson());

class ReverseDnsResponse {
  ReverseDnsResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory ReverseDnsResponse.fromJson(Map<String, dynamic> json) =>
      ReverseDnsResponse(
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
    this.ip,
  });

  String? tool;
  String? ip;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "ip": ip,
      };
}

class Response {
  Response({
    this.rdns,
  });

  String? rdns;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        rdns: json["rdns"],
      );

  Map<String, dynamic> toJson() => {
        "rdns": rdns,
      };
}
