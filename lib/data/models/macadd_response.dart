// To parse this JSON data, do
//
//     final macAddressResponse = macAddressResponseFromJson(jsonString);

import 'dart:convert';

MacAddressResponse macAddressResponseFromJson(String str) =>
    MacAddressResponse.fromJson(json.decode(str));

String macAddressResponseToJson(MacAddressResponse data) =>
    json.encode(data.toJson());

class MacAddressResponse {
  MacAddressResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory MacAddressResponse.fromJson(Map<String, dynamic> json) =>
      MacAddressResponse(
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
    this.mac,
  });

  String? tool;
  String? mac;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        mac: json["mac"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "mac": mac,
      };
}

class Response {
  Response({
    this.manufacturer,
  });

  String? manufacturer;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        manufacturer: json["manufacturer"],
      );

  Map<String, dynamic> toJson() => {
        "manufacturer": manufacturer,
      };
}
