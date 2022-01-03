// // To parse this JSON data, do
// //
// //     final portResonse = portResonseFromJson(jsonString);

// // ignore_for_file: constant_identifier_names

// import 'dart:convert';

// PortResponse portResonseFromJson(String str) =>
//     PortResponse.fromJson(json.decode(str));

// String portResonseToJson(PortResponse data) => json.encode(data.toJson());

// class PortResponse {
//   PortResponse({
//     this.response,
//   });

//   Response? response;

//   factory PortResponse.fromJson(Map<String, dynamic> json) => PortResponse(
//         response: Response.fromJson(json["response"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "response": response!.toJson(),
//       };
// }

// class Response {
//   Response({
//     this.port,
//   });

//   List<Port>? port;

//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//         port: List<Port>.from(json["port"].map((x) => Port.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "port": List<dynamic>.from(port!.map((x) => x.toJson())),
//       };
// }

// class Port {
//   Port({
//     this.number,
//     this.service,
//     this.status,
//   });

//   String? number;
//   String? service;
//   Status? status;

//   factory Port.fromJson(Map<String, dynamic> json) => Port(
//         number: json["number"],
//         service: json["service"],
//         status: statusValues.map![json["status"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "service": service,
//         "status": statusValues.reverse[status],
//       };
// }

// enum Status { OPEN, CLOSED }

// final statusValues = EnumValues({"closed": Status.CLOSED, "open": Status.OPEN});

// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map!.map((k, v) => MapEntry(v, k));
//     return reverseMap!;
//   }
// }
// To parse this JSON data, do
//
//     final portResponse = portResponseFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

PortResponse portResponseFromJson(String str) =>
    PortResponse.fromJson(json.decode(str));

String portResponseToJson(PortResponse data) => json.encode(data.toJson());

class PortResponse {
  PortResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory PortResponse.fromJson(Map<String, dynamic> json) => PortResponse(
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
    this.host,
  });

  String? tool;
  String? host;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        host: json["host"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "host": host,
      };
}

class Response {
  Response({
    this.port,
  });

  List<Port>? port;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        port: List<Port>.from(json["port"].map((x) => Port.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "port": List<dynamic>.from(port!.map((x) => x.toJson())),
      };
}

class Port {
  Port({
    this.number,
    this.service,
    this.status,
  });

  String? number;
  String? service;
  Status? status;

  factory Port.fromJson(Map<String, dynamic> json) => Port(
        number: json["number"],
        service: json["service"],
        status: statusValues.map![json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "service": service,
        "status": statusValues.reverse[status],
      };
}

enum Status { OPEN, CLOSED }

final statusValues = EnumValues({"closed": Status.CLOSED, "open": Status.OPEN});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
    return reverseMap!;
  }
}
