// To parse this JSON data, do
//
//     final spamDbResponse = spamDbResponseFromJson(jsonString);

import 'dart:convert';

SpamDbResponse spamDbResponseFromJson(String str) =>
    SpamDbResponse.fromJson(json.decode(str));

String spamDbResponseToJson(SpamDbResponse data) => json.encode(data.toJson());

class SpamDbResponse {
  SpamDbResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory SpamDbResponse.fromJson(Map<String, dynamic> json) => SpamDbResponse(
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
    this.dbs,
  });

  List<Db>? dbs;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        dbs: List<Db>.from(json["dbs"].map((x) => Db.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dbs": List<dynamic>.from(dbs!.map((x) => x.toJson())),
      };
}

class Db {
  Db({
    this.name,
    this.result,
  });

  String? name;
  Result? result;

  factory Db.fromJson(Map<String, dynamic> json) => Db(
        name: json["name"],
        result: resultValues.map![json["result"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "result": resultValues.reverse[result],
      };
}

// ignore: constant_identifier_names
enum Result { OK }

final resultValues = EnumValues({"ok": Result.OK});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
