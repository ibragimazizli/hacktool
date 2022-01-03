// To parse this JSON data, do
//
//     final freeEmailResponse = freeEmailResponseFromJson(jsonString);

import 'dart:convert';

FreeEmailResponse freeEmailResponseFromJson(String str) =>
    FreeEmailResponse.fromJson(json.decode(str));

String freeEmailResponseToJson(FreeEmailResponse data) =>
    json.encode(data.toJson());

class FreeEmailResponse {
  FreeEmailResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory FreeEmailResponse.fromJson(Map<String, dynamic> json) =>
      FreeEmailResponse(
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
    this.result,
  });

  String? result;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}
